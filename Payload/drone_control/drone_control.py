import time
import RPi.GPIO as GPIO
from dronekit import connect, VehicleMode
from enum import Enum
# Enum for GPIO pin setup
class Pin(Enum):
    SEPARATION_PIN = 18  # Example pin for H-bridge control
# Setup GPIO
GPIO.setmode(GPIO.BCM)  # BCM numbering double check that
GPIO.setup(Pin.SEPARATION_PIN.value, GPIO.OUT)
# Connect to the Vehicle still need code to make sure connection
print("Connecting to vehicle on: 'serial port here'")
vehicle = connect('/dev/ttyAMA0', wait_ready=True, baud=57600)  # Adjust serial port & baud rate
pause_script=False
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
def detach_drone(seconds):
    """
    Activates the GPIO pin to control the H bridge for drone detach.
    """
    print("Separating the drone")
    GPIO.output(Pin.DETACH_PIN.value, GPIO.HIGH)
    time.sleep(seconds)  # Simulate the separation process
    GPIO.output(Pin.DETACH_PIN.value, GPIO.LOW)
    print("Drone separated")
    
def process_packets():
    """
    Placeholder for processing received packets. Implement as needed.
    """
    pass


@vehicle.on_attribute('last_heartbeat')
def listener(self, attr_name, value):
    global pause_script
    if value > 1 and not pause_script:
        print("Pausing script due to bad link")
        pause_script=True
    if value < 1 and pause_script:
        pause_script=False
        print("Un-pausing script")

def main():
    while True:
        #check if we are connected, and if not we are going to reconnect
        #transmit the vehicle status do a delta time 2 seconds
        print("Status: %s" % vehicle.system_status.state)
        print("Battery: %s" % vehicle.mode.name)
        print("Mode: %s" % vehicle.mode.name)
        print("Altitude: %s" % vehicle.location.global_relative_frame.alt)
        #this will check if we have RSO permission.
        packet = process_packets()
        if packet == "rso":
            rsoPermission = True
        #if we have rso, and have not  separated yet, do the process.
        if rsoPermission and vehicle.location.global_relative_frame.alt < 122 and not separationCompleted:
            detach_drone()
            arm_drone_and_land()
            separationCompleted = True
        #Backup if something goes wrong, force arm or force separate.
        if packet == "detach":
            detach_drone()
        if packet == "arm":
            arm_drone_and_land()

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("Program terminated by user")
    finally:
        GPIO.cleanup()  # Clean up GPIO to ensure a clean exit