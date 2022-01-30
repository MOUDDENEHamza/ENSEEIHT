import cv2
import mediapipe as mp
from generate_csv import get_connections_list, get_distance
from tensorflow import keras
import numpy as np
import pandas as pd
import requests
import os

def get_sign_list():
    # Function to get all the values in SIGN column
    df = pd.read_csv('connections.csv', index_col=0)
    return df['SIGN'].unique()

def real_time_prediction():
    result = ""
    sign_list = get_sign_list()
    mp_drawing = mp.solutions.drawing_utils
    mp_hands = mp.solutions.hands
    connections_dict = get_connections_list()

    # Initialize webcam
    # Default is zero, try changing value if it doesn't work
    cap = cv2.VideoCapture(0)

    with mp_hands.Hands(static_image_mode=False, max_num_hands=1, min_detection_confidence=0.5) as hands:
        while cap.isOpened():
            # Get image from webcam, change color channels and flip
            ret, frame = cap.read()
            image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            image = cv2.flip(image, 1)

            # Get result
            results = hands.process(image)
            if not results.multi_hand_landmarks:
                # If no hand detected, then just display the webcam frame
                cv2.imshow(
                    'Sign Language Detection',
                    frame
                )
            else:
                # If hand detected, superimpose landmarks and default connections
                mp_drawing.draw_landmarks(
                    image, results.multi_hand_landmarks[0], mp_hands.HAND_CONNECTIONS
                )

                # Get landmark coordinates & calculate length of connections
                coordinates = results.multi_hand_landmarks[0].landmark
                data = []
                for _, values in connections_dict.items():
                    data.append(get_distance(coordinates[values[0]], coordinates[values[1]]))
                
                # Scale data
                data = np.array([data])
                data[0] /= data[0].max()
                
                # Load model from h5 file
                model = keras.models.load_model('ann_model.h5')

                # Get prediction
                pred = np.array(model(data))
                pred = sign_list[pred.argmax()]

                image = cv2.cvtColor(cv2.flip(image, 1), cv2.COLOR_BGR2RGB)

                # Display text showing prediction
                image = cv2.putText(
                    image, pred, (20, 90), 
                    cv2.FONT_HERSHEY_SIMPLEX, 3, 
                    (255, 0, 0), 2
                )

                # Display final image
                cv2.imshow(
                    'Sign Language Detection',
                    image
                )
                

            # Each frame will be displayed for 20ms (50 fps)
            key = cv2.waitKey(20)
            # Press SPACEBAR to append to query
            if key == ord(' ') and results.multi_hand_landmarks:
                result += pred
                print("Current Query:", result)
            # Press backspace to delete previous letter
            elif key == 8 and result != "":
                result = result[:-1]
                print(("Current Query: " + result) if result != "" else "Query has been emptied..")
            # Press E to send Query
            elif key == ord('e'):
                if result != "":
                    print("SENDING QUERY:", result)
                    try:
                        url = "http://192.168.1.8:8080/api/command/perform"
                        res = requests.post(url, json = {'query' : result.lower()})
                        
                        cmd = res.content.decode("utf-8")
                        print("RECEIVED COMMAND:", cmd)
                        os.system(cmd)
                        result = ""
                        print("Query has been sent and emptied..")
                    except Exception as err:
                        print("ERROR: Could not send query..")
                        print(str(err))
                    continue;
                else:
                    print("EMPTY QUERY.. SENDING ABORTED!")
            # Press Q on keyboard to quit
            elif key == ord('q'):
                print("EXITING")
                break
            
        
        cap.release()
        cv2.destroyAllWindows()


if __name__ == "__main__":
    try:
        real_time_prediction()
    except:
        print("ERROR OCCURED.. ABORTING")
