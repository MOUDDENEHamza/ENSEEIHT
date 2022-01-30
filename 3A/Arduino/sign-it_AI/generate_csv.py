import mediapipe as mp
import cv2
import numpy as np
import pandas as pd
import os

def get_image_list(dir="./images/"):
    # Get all the folder names
    image_folders = os.listdir(dir)
    # Dictionary to store the information
    image_dict = {}
    # Iterating over all the folders
    for folder in image_folders:
        # List of all images
        # Some files are missing (or improperly labelled)
        # As a result, only storing the first and last files wouldn't work
        image_dict[folder] = os.listdir(f"{dir}{folder}/")
    return image_dict

def get_connections_list():
    # All landmark names and values: https://google.github.io/mediapipe/images/mobile/hand_landmarks.png
    return {
        "WRIST_TO_THUMB_MCP": (0, 2),
        "WRIST_TO_THUMB_IP": (0, 3),
        "WRIST_TO_THUMB_TIP": (0, 4),
        "WRIST_TO_INDEX_FINGER_PIP": (0, 6),
        "WRIST_TO_INDEX_FINGER_DIP": (0, 7),
        "WRIST_TO_INDEX_FINGER_TIP": (0, 8),
        "WRIST_TO_MIDDLE_FINGER_PIP": (0, 10),
        "WRIST_TO_MIDDLE_FINGER_DIP": (0, 11),
        "WRIST_TO_MIDDLE_FINGER_TIP": (0, 12),
        "WRIST_TO_RING_FINGER_PIP": (0, 14),
        "WRIST_TO_RING_FINGER_DIP": (0, 15),
        "WRIST_TO_RING_FINGER_TIP": (0, 16),
        "WRIST_TO_PINKY_PIP": (0, 18),
        "WRIST_TO_PINKY_DIP": (0, 19),
        "WRIST_TO_PINKY_TIP": (0, 20),
        "THUMB_MCP_TO_THUMB_TIP": (2, 4),
        "INDEX_FINGER_MCP_TO_INDEX_FINGER_TIP": (5, 8),
        "MIDDLE_FINGER_MCP_TO_MIDDLE_FINGER_TIP": (9, 12),
        "RING_FINGER_MCP_TO_RING_FINGER_TIP": (13, 16),
        "PINKY_MCP_TO_PINKY_TIP": (17, 20),
        "THUMB_TIP_TO_INDEX_FINGER_MCP": (4, 5),
        "THUMB_TIP_TO_INDEX_FINGER_PIP": (4, 6),
        "THUMB_TIP_TO_INDEX_FINGER_DIP": (4, 7),
        "THUMB_TIP_TO_INDEX_FINGER_TIP": (4, 8),
        "THUMB_TIP_TO_MIDDLE_FINGER_MCP": (4, 9),
        "THUMB_TIP_TO_MIDDLE_FINGER_PIP": (4, 10),
        "THUMB_TIP_TO_MIDDLE_FINGER_DIP": (4, 11),
        "THUMB_TIP_TO_MIDDLE_FINGER_TIP": (4, 12),
        "THUMB_TIP_TO_RING_FINGER_MCP": (4, 13),
        "THUMB_TIP_TO_RING_FINGER_PIP": (4, 14),
        "THUMB_TIP_TO_RING_FINGER_DIP": (4, 15),
        "THUMB_TIP_TO_RING_FINGER_TIP": (4, 16),
        "THUMB_TIP_TO_PINKY_MCP": (4, 17),
        "THUMB_TIP_TO_PINKY_PIP": (4, 18),
        "THUMB_TIP_TO_PINKY_DIP": (4, 19),
        "THUMB_TIP_TO_PINKY_TIP": (4, 20)
    }

def get_distance(first, second):
    # Calculate distance from two coordinates
    return np.sqrt(
        (first.x - second.x) ** 2 
        + (first.y - second.y) ** 2 
        + (first.z - second.z) ** 2
    )

def create_connections_csv():
    # mediapipe code
    mp_drawing = mp.solutions.drawing_utils
    mp_hands = mp.solutions.hands

    # Run the functions to the get the image directory tree and connection dictionary
    connections_dict = get_connections_list()
    image_dict = get_image_list()

    # List to store all the data to be put in the dataframe
    data = []

    with mp_hands.Hands(static_image_mode=True, max_num_hands=1, min_detection_confidence=0.5) as hands:
        # Iterating over all the folders
        for folder, image_names in image_dict.items():
            print(f"Processing folder: {folder}")
            # Iterating over all the images in folder
            for image_name in image_names:
                # Read image with OpenCV, flip, convert BGR to RGB
                image = cv2.imread(f"./images/{folder}/{image_name}")
                image = cv2.flip(image, 1)
                image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

                # Get coordinates from mediapipe
                results = hands.process(image)
                if not results.multi_hand_landmarks:
                    continue
                coordinates = results.multi_hand_landmarks[0].landmark

                # Calculate distances and append the row to data
                row = []
                for _, values in connections_dict.items():
                    row.append(get_distance(coordinates[values[0]], coordinates[values[1]]))
                row.append(folder)
                data.append(row)
    
    # Create dataframe
    columns = list(connections_dict.keys())
    columns.append('SIGN')
    df = pd.DataFrame(data=data, columns=columns)
    # Export to CSV file
    df.to_csv('connections.csv')

if __name__ == "__main__":
    create_connections_csv()
