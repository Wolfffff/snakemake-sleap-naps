import cv2
import numpy as np


videopath = "tests/data/videos/example_video_1.mp4"
aruco_dict = cv2.aruco.Dictionary_get(cv2.aruco.DICT_4X4_100)
aruco_params = cv2.aruco.DetectorParameters_create()

output_arr = np.empty((1200, 2, 100))
output_arr[:] = np.nan
cap = cv2.VideoCapture(videopath)

while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    frame_number = int(cap.get(cv2.CAP_PROP_POS_FRAMES))
    
    (corners, ids, rejected) = cv2.aruco.detectMarkers(
        frame, aruco_dict, parameters=aruco_params
    )
    
    if ids is not None and len(corners) > 0:
        ids = ids.flatten()
        for markerCorner, markerID in zip(corners, ids):
            corners = markerCorner.reshape((4, 2))
            (topLeft, topRight, bottomRight, bottomLeft) = corners
            mid = (topLeft + bottomRight) / 2
            output_arr[frame_number, :, markerID] = mid
    
    if frame_number % 100 == 0:
        print(f"Frame number: {frame_number}")
    
    if frame_number == 1200:
        break

cap.release()

# Clean up the output array
mask = np.all(np.isnan(output_arr[:, 0, :]), axis=0)
cleaned_output = output_arr[:, :, ~mask]
cleaned_output = cleaned_output[:, np.newaxis, :, :]
print(cleaned_output.shape)

# Save the cleaned output array
np.save("example-output/project_1/output/example_video_1.mp4_aruco_only.npy", cleaned_output)