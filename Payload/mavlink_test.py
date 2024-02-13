
from pymavlink import mavutil

#start a connection listening to a UDP port
the_connection = mavutil.mavlink_connection('udpin:localhost:14551')

''' 
wait for hearbeat - the quadcopter is essentially always sending out heartbeats letting GCS 
and whatever other program know that the aircraft is there.
Copter has a System ID and Component ID of the mavlink connection node. 

'''
the_connection.wait_heartbeat()
print("Heartbeat from System (system %u compenent %u)" % 
    (the_connection.target_system, the_connection.target_component))

'''
going to recieve all available messages: 
using an arbitrary counter to stop it eventually. 
Not necessary for flying the drone, just good for testing
'''
counter = 0
while(counter < 20):
    msg = the_connection.recv_match(blocking=True)
    print(msg)
    counter+=1

    '''
    can filter for messages like this, with ATTITUDE as an example:
    msg = the_connection.recv_match(type = 'ATTITUDE', blocking=True)
    '''

'''
How to send a Mavlink command to the quadcopter using the command protocol
when we send a command, the program sends the command_long to the drone. Upon recieving the command,
the drone will try to enact that command. Based on success or failure, the drone will send back a 
command acknowledgement COMMAND_ACK and send it back to our program. Based on that, we can tell if the command
was successful or not. Every command_long needs a target system, component, command, and confirmation.  (seems like always putting confirmation=0 is fine)
after these 4, we enter command specific parameters
'''

#This is the arming command, to disarm we would just need to set the 1 to a 0.
the_connection.mav.command_long_send(the_connection.target_system, the_connection.target_component, 
                                    mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM, 0, 1, 0, 0, 0, 0, 0, 0)

#Check for Command Acknowledgement back from the copter. 0 is the success value. 1-6 indicate specific errors.
armAck = the_connection.recv_match(type='COMMAND_ACK', blocking=True)
print("The Copter Acknowledgment Value for arming is: ", armAck, " .")

'''
Programming the takeoff command. Parameters pitch, empty, empty, yaw, lat, lon, alt.
alt is most imporat, Measured in meters.
Make sure we're in "Guided" mode on Mission Planner before trying to arm or else we may see errors. 
'''
the_connection.mav.command_long_send(the_connection.target_system, the_connection.target_component, 
                                    mavutil.mavlink.MAV_CMD_NAV_TAKEOFF, 0, 0, 0, 0, 0, 0, 0, 10)

takeOffAck = the_connection.recv_match(type='COMMAND_ACK', blocking=True)
print("The Copter Acknowledgment Value for takeoff is: ", takeOffAck, " .")

'''
Programming Movement
ArduPilot reccomends using SET__POSITION_ TARGET_LOCAL_NED, SET_POSITION for setting waypoints, SET_POSITION_TARGET_GLOBAL_INT using lat/long coordinates,
and then SET_ATTITUDE_TARGET. Also have a SET_HOME_POSITION which could be useful when returning the drone. 
The 15,7,-8 parameters mean North 15 meters, East 7 meters, and up 8 meters. In NED frame, up is negative and down is positive. The 0's after the 
movement parameters are for x,y,z velocity which we can set to 0's because our type mask does that for us. A
type mask pretty much tells the copter which fields should be ignored: 1 is meant to ignore velo and a 0 factors it in.
'''
the_connection.mav.send(mavutil.mavlink.MAVLink_set_position_target_local_ned_message(10, the_connection.target_system, the_connection.target_component,
                                                                                    mavutil.mavlink.MAV_FRAME_LOCAL_NED, int(0b110111111000), 15, 7, -8, 
                                                                                    0, 0, 0, 0, 0, 0, 0, 0))