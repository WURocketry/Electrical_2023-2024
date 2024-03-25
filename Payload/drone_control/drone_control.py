import time
import RPi.GPIO as GPIO
from dronekit import connect, VehicleMode, APIException, SerialException
from enum import Enum
import board
import busio
import digitalio
import adafruit_rfm9x
from datetime import datetime
# Enum for GPIO pin setup
class Pin(Enum):
    SEPARATION_PIN = 18  # Example pin for H-bridge control
    DETACH_PIN = 19 # Modify the number to match the actual GPIO pin number we are using

class PacketStatus(Enum):
    INITIAL = "INITIAL"
    RSO_RECEIVED = "RSO_RECEIVED"
    FORCE_DETACH = "EMERGENCY_DETACH"
    FORCE_ARM = "EMERGENCY_ARM"
    DETACHED = "DETACHED"
    ARMED = "ARMED"

# Define radio parameters.

RADIO_FREQ_MHZ = 915  # Frequency of the radio in Mhz. Must match your module! Can be a value like 915.0, 433.0, etc.

# Define pins connected to the chip, use these if wiring up the breakout according to the guide:
CS = digitalio.DigitalInOut(board.CE1)
RESET = digitalio.DigitalInOut(board.D6)

# Initialize SPI bus.
spi = busio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)

# Initialze RFM radio
rfm9x = adafruit_rfm9x.RFM9x(spi, CS, RESET, RADIO_FREQ_MHZ)

# You can however adjust the transmit power (in dB).  The default is 13 dB but
# high power radios like the RFM95 can go up to 23 dB:
rfm9x.tx_power = 23

# ttyACM0 for flight, tested friday night, worked
connection_port = '/dev/ttyACM0' # ttyAMA0 on old github not sure if this port works -- ttyACM0
DETACH_HEIGHT = 122
HEARTBEAT_SECONDS_RECONNECTION = 5
DETACH_SECONDS = 30

# Setup GPIO
GPIO.setmode(GPIO.BCM)  # BCM numbering double check that
GPIO.setup(Pin.SEPARATION_PIN.value, GPIO.OUT)
'''
# Connect to the Vehicle still need code to make sure connection
print("Connecting to vehicle on: 'serial port here'")
vehicle = connect('/dev/ttyAMA0', wait_ready=True)  # Adjust serial port & baud rate
pause_script=False
'''
# fail safe
separationCompleted = False

def establish_connection():
    global vehicle
    try:
        vehicle = connect(connection_port, wait_ready=True, heartbeat_timeout=30)
        print("Vehicle connected!")
    except APIException as e:
        print(f"Connection failed: {e}")
        vehicle = None
        #catch an exception
    except SerialException as f:
        print(f"SerialException occured: {f}")
        vehicle = None
    except FileNotFoundError as g:
        print(f"File is not found: {g}")

def arm_drone_and_land():
    """
    Arms the vehicle and changes its flight mode to LAND.
    """
    print("Arming drone")
    vehicle.armed = True
    while not vehicle.armed:
        print(" Waiting for arming...")
    print("Turning on Land Mode")
    vehicle.mode = VehicleMode("LAND")
    print("Drone is armed and in LAND mode")

def detach_drone():
    """
    Activates the GPIO pin to control the H bridge for drone detach.
    """
    print("Separating the drone")
    GPIO.output(Pin.DETACH_PIN.value, GPIO.HIGH)
    time.sleep(DETACH_SECONDS)  # Simulate the separation process
    GPIO.output(Pin.DETACH_PIN.value, GPIO.LOW)
    print("Drone separated")
    
def process_packets(status):
    """
    Placeholder for processing received packets. Implement as needed.
    """
    packet = rfm9x.receive() # blocking code of execution -- need confirmation from official documentation
    # Optionally change the receive timeout from its default of 0.5 seconds:
    # packet = rfm9x.receive(timeout=5.0)
    # If no packet was received during the timeout then None is returned.
    if packet is None: # it would be the else branch only 
        # Packet has not been received
	    #LED.value = False
        print("Received nothing! Listening again...")
    else:
        # Received a packet!
        # LED.value = True
        # Print out the raw bytes of the packet:
        print("Received (raw bytes): {0}".format(packet))
        # And decode to ASCII text and print it too.  Note that you always
        # receive raw bytes and need to convert to a text format like ASCII
        # if you intend to do string processing on your data.  Make sure the
        # sending side is sending ASCII data before you try to decode!
        packet_text = str(packet, "ascii")
        print("Received (ASCII): {0}".format(packet_text))
        if packet_text == "RSO":
            status = PacketStatus.RSO_RECEIVED
        if packet_text == "DETACH":
            status = PacketStatus.FORCE_DETACH
        if packet_text == "ARM":
            status = PacketStatus.FORCE_ARM
        # Also read the RSSI (signal strength) of the last received message and
        # print it.
        rssi = rfm9x.last_rssi
        print("Received signal strength: {0} dB".format(rssi))
    return status

# TODO: test 
def transmit_packets(status):
    info_string = (
        "Status: {0}\n"
        "Battery: {1}\n"
        "Mode: {2}\n"
        "Altitude: {3}\n"
        "Payload defined Status: {4}\n"
        "Last heartbeat: {5}"
    ).format(
        vehicle.system_status.state,
        vehicle.battery,
        vehicle.mode.name,
        vehicle.location.global_relative_frame.alt,
        status,
        vehicle.last_heartbeat
    )
    
    info_bytes = info_string.encode("utf-8")
    rfm9x.send(info_bytes)

def write_to_file(status):
    with open('status_log.txt', 'a') as f:
        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        f.write("Time: %s\n" % current_time)
        f.write("Status: %s\n" % vehicle.system_status.state)
        f.write("Battery: %s\n" % vehicle.battery)
        f.write("Mode: %s\n" % vehicle.mode.name)
        f.write("Altitude: %s\n" % vehicle.location.global_relative_frame.alt)
        f.write("Payload defined Status: %s\n" % status)
        f.write("Last heartbeat: %s\n" % vehicle.last_heartbeat)

def main(status):
    last_write_time = 0
    establish_connection()
    while(vehicle is None):
        print("The first connection attempt failed, entering 5 second reconnection loop")
        time.sleep(5)
        establish_connection()

    while(True):

        if(vehicle.last_heartbeat > HEARTBEAT_SECONDS_RECONNECTION):
            print("The connection has been detected as lost, entering the reconnection loop")
            establish_connection()
            while(vehicle is None):
                print("Connection Failed Again, Proceeding to retry every 5 seconds")
                time.sleep(5)
                establish_connection()
         # Check if it's time to write to the file
        current_time = time.time()
        # Check if 100 milliseconds have elapsed since the last write operation
        if current_time - last_write_time >= 0.1:
            # Call write_to_file() function
            write_to_file(status)
            # Update the last write time
            last_write_time = current_time

        print("Status: %s" % vehicle.system_status.state)
        print("Battery: %s" % vehicle.battery)
        print("Mode: %s" % vehicle.mode.name)
        print("Altitude: %s" % vehicle.location.global_relative_frame.alt)
        print("Payload defined Status: %s" % status)
        print("Last heartbeat: %s" % vehicle.last_heartbeat)
        transmit_packets(status)
        #this will check if we have RSO permission.
        status = process_packets(status)

        #if we have rso, and have not  separated yet, do the process.
        if status == PacketStatus.RSO_RECEIVED and vehicle.location.global_relative_frame.alt < DETACH_HEIGHT and not separationCompleted:
            detach_drone()
            status = PacketStatus.DETACHED
            arm_drone_and_land()
            separationCompleted = True
            status = PacketStatus.ARMED
    
        #Backup if something goes wrong, force arm or force separate.
        if status == PacketStatus.FORCE_DETACH:
            detach_drone()
            status = PacketStatus.DETACHED
        if status == PacketStatus.FORCE_ARM:
            arm_drone_and_land()
            status = PacketStatus.ARMED
    

if __name__ == "__main__":
    try:
        with open('status_log.txt', 'a') as f:
            f.write("NEW FLIGHT\n")
        status = PacketStatus.INITIAL
        main(status)
    except KeyboardInterrupt:
        print("Program terminated by user")
    finally:
        GPIO.cleanup()  # Clean up GPIO to ensure a clean exit
