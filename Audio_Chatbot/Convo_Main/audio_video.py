import cv2
from ffpyplayer.player import MediaPlayer


def getVideoSource(source, width, height):
    cap = cv2.VideoCapture(source)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, width)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, height)
    return cap


def main():
    sourcePath = "ques_video/ques3.mp4"
    camera = getVideoSource(sourcePath, 720, 480)
    player = MediaPlayer(sourcePath)

    while True:
        grabbed, frame = camera.read()
        audio_frame, val = player.get_frame()

        if not grabbed:
            print("End of video")
            break

        frame = cv2.resize(frame, (720, 480))
        cv2.imshow('Camera', frame)

        if cv2.waitKey(28) & 0xFF == ord('q'):
            break

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

        if val != 'eof' and audio_frame is not None:
            # Retrieve audio frame and playback
            audio_data = audio_frame.to_ndarray().flatten()
            player.get_ffmpeg().set_pause(False)
            player.get_ffmpeg().set_audio_buffer_size(len(audio_data))
            player.get_ffmpeg().set_audio_frame(audio_data)

    camera.release()
    cv2.destroyAllWindows()


if __name__ == "__main__":
    main()
