from pandas import read_csv
import matplotlib.pyplot as plt
from simple_pid import PID

def predictVelocity(timeStep, acc, altitude, velocity, plot, start, end):
    velocities = []
    altitudes = []
    for i in range(start,end):
        velocity = velocity + acc[i]*timeStep
        velocities.append(velocity)
        altitude = altitude + velocity*timeStep
        altitudes.append(altitude)

    if plot:
        plt.subplot(2,1,1)
        plt.plot(time[start:end],vTrue[start:end], label="EasyMini Values")
        plt.plot(time[start:end], velocities, label="Predicted Values")
        plt.ylabel("Speed (m/s)")
        plt.xlabel("Time (s)")
        plt.legend(loc="upper right")

        plt.subplot(2,1,2)
        plt.plot(time[start:end],altitudeEM[start:end], label="EasyMini Values")
        plt.plot(time[start:end], altitudes, label="Predicted Values")
        plt.ylabel("Altitude (m)")
        plt.xlabel("Time (s)")
        plt.legend(loc="lower right")
        
        plt.show()

    return altitude

# data = read_csv("Huntsville Data EasyMini.csv")

# time = data['time'].tolist()
# acc = data['acceleration'].tolist()
# altitudeEM = data['altitude'].tolist()
# vTrue = data['speed'].tolist()

# predictApogeeEulers(0.01, acc, 263.53, 45.57, True, 33, 1610)


##### Above section predicts velocity

def interpolate(tValue, times, acc):
    for i in range(0, len(times)):
        if(times[i] > tValue):
            slope = (acc[i]-acc[i-1]) / (times[i]- times[i-1])
            dt = tValue - times[i-1]
            return acc[i-1] + slope * dt
    return 0
        

def predictActualApogee2(step, time, acc, velocity, altitude):
    mass = 19.43 # kg
    rho = 1.293
    Cd = 0.6
    area = 0.0080825645
    tstep = 0.01
    thrustEnd = 2.911
    while(velocity >= 0):
        if step < thrustEnd:
            thrustAcc = interpolate(step, time, acc)
            thrust = thrustAcc - (9.81 * mass) - (0.5 * rho * velocity * velocity * Cd * area)
            acceleration = thrust / mass
            velocity = velocity + acceleration * tstep
        else:
            thrust = -(9.81 * mass) - (0.5 * rho * velocity * velocity * Cd * area)
            acceleration = thrust / mass
            velocity = velocity + acceleration*tstep
        altitude = altitude + velocity * tstep
        # print("Velocity: " + str(velocity))
        # print("Altitude: " + str(altitude))
        step += tstep
    
    return altitude

# aerotech = read_csv("AeroTech_L1390G.csv")
# time = aerotech['Time(s)']
# thrust = aerotech['Thrust(N)']

# print(predictActualApogee2(0.01, time, thrust, 0, 0))

#### Above section predicts apogee with thrust interpolation


def predictActualApogee(step, time, acc, velocity, altitude):
    mass = 19.43 # kg
    rho = 1.293
    Cd = 0.6
    area = 0.0080825645
    while(velocity >= 0):
        if step < len(time):
            thrust = acc[step] - (9.81 * mass) - (0.5 * rho * velocity * velocity * Cd * area)
            acceleration = thrust / mass
            tstep = time[step]-time[step-1]
            velocity = velocity + acceleration * tstep
        else:
            thrust = -(9.81 * mass) - (0.5 * rho * velocity * velocity * Cd * area)
            acceleration = thrust / mass
            tstep = 0.01
            velocity = velocity + acceleration*tstep
        altitude = altitude + velocity * tstep
        # print("Velocity: " + str(velocity))
        # print("Altitude: " + str(altitude))
        step+=1
    
    return altitude

# aerotech = read_csv("AeroTech_L1390G.csv")
# time = aerotech['Time(s)']
# thrust = aerotech['Thrust(N)']

# print(predictActualApogee2(0.01, time, thrust, 0, 0))

#### Above section predicts apogee WITHOUT thrust interpolation

def simulateFlight(time, acc, velocity, altitude):
    times = []
    accelerations = []
    velocities = []
    altitudes = []
    outputs = []
    dragChanges = []
    thrusts = []

    step = 0.01
    tstep = 0.01
    mass = 19.43 # kg
    rho = 1.293
    Cd = 0.6
    area = 0.0080825645
    thrustEnd = 2.911
    ## Default PID Controller with desired apogeee
    pid = PID(1, 0.1, 0.05, setpoint=1380)
    while(velocity >= 0):
        if step < thrustEnd:
            thrustAcc = interpolate(step, time, acc)
            thrust = thrustAcc - (9.81 * mass) - (0.5 * rho * velocity * velocity * Cd * area)
            acceleration = thrust / mass
            velocity = velocity + acceleration * tstep
        else:
            thrust = -(9.81 * mass) - (0.5 * rho * velocity * velocity * Cd * area)
            acceleration = thrust / mass
            velocity = velocity + acceleration*tstep
        altitude = altitude + velocity * tstep
        # print("Velocity: " + str(velocity))
        # print("Altitude: " + str(altitude))
        step += tstep

        ## IMPORTANT PART
        ## predict apogee after each step
        if(step > 1):
            predicted = predictActualApogee2(step, time, acc, velocity, altitude)
            output = pid(predicted)
            dragChange = abs(predicted - output) / predicted
            areaChange = abs(predicted - output) / predicted
        else:
            output = 0
            dragChange = 1
            # areaChange = 1   
        ## output is going to be apogee we should try to hit in our next step
        ## so we change drag coefficient and area so change force on the rocket
        ## we will have to create some formula to go from apogee change to drag change
        
        
        Cd = Cd * dragChange
        # area = area * areaChange

        times.append(step)
        accelerations.append(acceleration)
        velocities.append(velocity)
        altitudes.append(altitude)
        outputs.append(Cd)
        dragChanges.append(dragChange)
        thrusts.append(thrust)
    
    print("Final Altitude: " + str(altitude) + "m")

    plt.subplot(2,3,1)
    plt.plot(times,velocities)
    plt.ylabel("Speed (m/s)")
    plt.xlabel("Time (s)")
    plt.title("Speed")

    plt.subplot(2,3,2)
    plt.plot(times,accelerations)
    plt.ylabel("Accelerations (m/s^2)")
    plt.xlabel("Time (s)")
    plt.title("Acceleration")

    plt.subplot(2,3,3)
    plt.plot(times,altitudes)
    plt.ylabel("Altitude (m)")
    plt.xlabel("Time (s)")
    plt.title("Altitude")

    plt.subplot(2,3,4)
    plt.plot(times,outputs)
    plt.ylabel("Apogee Change (m)")
    plt.xlabel("Time (s)")
    plt.title("PID Output")

    plt.subplot(2,3,5)
    plt.plot(times,dragChanges)
    plt.ylabel("Drag Changes")
    plt.xlabel("Time (s)")
    plt.title("Drag Changes")

    plt.subplot(2,3,6)
    plt.plot(times,thrusts)
    plt.ylabel("Thrust (N)")
    plt.xlabel("Time (s)")
    plt.title("Thrust")

    plt.show()

aerotech = read_csv("AeroTech_L1390G.csv")
time = aerotech['Time(s)']
thrust = aerotech['Thrust(N)']

simulateFlight(time, thrust, 0, 0)

