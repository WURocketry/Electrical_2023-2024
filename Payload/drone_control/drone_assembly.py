import time
import RPi.GPIO as GPIO
from enum import Enum
import argparse

class Pin(Enum):
    ASSERT_Q1 = 8
    ASSERT_Q2 = 10

parser = argparse.ArgumentParser(description="Parameters for program")
parser.add_argument('--time', action='store', type=float, default=5)
parser.add_argument('--s1', action='store_true')
parser.add_argument('--s2', action='store_true')
parser.add_argument('--q1', action='store_true')
parser.add_argument('--q2', action='store_true')
args = parser.parse_args()

ROTATION_TIME = args.time   # time to run motor
S1 = args.s1                # S1 asserted
S2 = args.s2                # S2 asserted
Q1 = args.q1                # Q1 asserted
Q2 = args.q2                # Q2 asserted

if Q2:
    ASSEMBLE_PIN = Pin.ASSERT_Q2
elif Q1:
    ASSEMBLE_PIN = Pin.ASSERT_Q1

GPIO.setmode(GPIO.BCM)              # Board numbering mode

if Q1 or Q2:
    GPIO.setup(ASSEMBLE_PIN, GPIO.OUT)  

GPIO.output(ASSEMBLE_PIN, GPIO.LOW) # pull this low to make sure that motor circuit is open

def main():
    # error handling
    STOP = False
    if S1 and ASSEMBLE_PIN == Pin.ASSERT_Q1:
        print("CLOSE S2 TO ASSERT Q1")
        STOP = True
    if S2 and ASSEMBLE_PIN == Pin.ASSERT_Q2:
        print("CLOSE S1 TO ASSERT Q2")
        STOP = True
    if S1 and S2:
        print("BOTH MECHANICAL SWITCHES CLOSED")
        STOP = True
    if Q1 and Q2:
        print("BOTH TRANSISTORS BEING ASSERTED")
        STOP = True
    if not S1 and not S2:
        print("BOTH MECHANICAL SWITCHES OPEN")
        STOP = True
    if not Q1 and not Q2:
        print("NO TRANSISTORS ASSERTED")
        STOP = True

    if STOP:
        return

    GPIO.output(ASSEMBLE_PIN, GPIO.HIGH)    # Spin motor
    time.sleep(ROTATION_TIME)
    GPIO.output(ASSEMBLE_PIN, GPIO.LOW)     # Stop motor

main()
GPIO.cleanup()