from picamera import PiCamera
import picamera.array
import time
import cv2

t1 = time.time()
camera = PiCamera()
camera.framerate = 30
stream = picamera.array.PiRGBArray(camera)

t2 = time.time()
camera.resolution = (320, 208)
camera.capture('testing1.png')

t4 = time.time()
camera.capture(stream, format='bgr')
image = stream.array
stream.truncate(0)
t5 = time.time()
cv2.imwrite('testing3.png', image)

t6 = time.time()
camera.capture(stream, format='bgr', use_video_port=True)
image = stream.array
stream.truncate(0)

t7 = time.time()
cv2.imwrite('testing4.png', image)
t8 = time.time()

print (f'Framerate: {camera.framerate}')
print (f'time to setup object PiCamera: {t2-t1:1.3f}')
print (f'time to take and save first picture: {t3-t2:1.3f}')
print (f'time to take and save smaller picture: {t4-t3:1.3f}')
print (f'time to take streamed image: {t5-t4:1.3f}')
print (f'time to save streamed image: {t6-t5:1.3f}')
print (f'time to take w use_video_port & stream: {t7-t6:1.3f}')
print (f'time to save streamed image: {t8-t7:1.3f}')

