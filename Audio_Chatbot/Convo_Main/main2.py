import os
from os import PathLike
from time import time
import asyncio
from typing import Union
import cv2
from dotenv import load_dotenv
import openai
from deepgram import Deepgram

from pygame import mixer
from ffpyplayer.player import MediaPlayer
import elevenlabs


from record import speech_to_text


# Load API keys
load_dotenv()
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
DEEPGRAM_API_KEY = os.getenv("DEEPGRAM_API_KEY")
elevenlabs.set_api_key(os.getenv("ELEVENLABS_API_KEY"))

# Initialize APIs
gpt_client = openai.Client(api_key=OPENAI_API_KEY)
deepgram = Deepgram(DEEPGRAM_API_KEY)
# mixer is a pygame module for playing audio
mixer.init()

# Change the context if you want to change Jarvis' personality
context = "You are Jarvis, Alex's human assistant. You are witty and full of personality. Your answers should be limited to 1-2 short sentences."
conversation = {"Conversation": []}
RECORDING_PATH = "audio/recording.wav"


questions_text = [
    "Hello! May I know your name?",
    "Can you describe the symptoms or health issues you are experiencing?",
    "Do you have any existing medical conditions or allergies? Are you currently taking any medications?",
    "In case of an emergency, do you have easy access to emergency services or a nearby health center?",
    "Would you like to schedule a follow-up consultation with a healthcare professional?"
]

# Loop through each question
for i, question_text in enumerate(questions_text):
    # Convert text question to audio and save
    question_audio_path = f"audio/question_{i+1}.wav"
    elevenlabs.save(elevenlabs.generate(text=question_text, voice="Adam", model="eleven_monolingual_v1"),
                    question_audio_path)
    print(f"Question {i + 1}: {question_text} - Saved as {question_audio_path}")

from ffpyplayer.player import MediaPlayer


# def play_video_with_audio(video_path, audio_path):
#     cap = cv2.VideoCapture(video_path)
#     audio = AudioSegment.from_file(audio_path)
#
#     player = MediaPlayer(video_path)
#     fs = 44100  # Sample rate for the audio
#
#     while True:
#         grabbed, frame = cap.read()
#         audio_time = int(cap.get(cv2.CAP_PROP_POS_MSEC))
#
#         if not grabbed:
#             print("End of video")
#             break
#
#         cv2.imshow('Video', frame)
#
#         # Play audio
#         audio_chunk = audio[audio_time:audio_time + int(1000 / fs)]
#         audio_chunk.export("temp_audio.wav", format="wav")
#         player.get_audio_buffers()
#         player.set_audio_buffers([(b, fs) for b in [bytearray(audio_chunk.raw_data)]])
#         player.play_audio()
#
#         if cv2.waitKey(30) & 0xFF == ord('q'):
#             break
#
#     cap.release()
#     cv2.destroyAllWindows()


def play_video_with_audio(video_path, audio_path):
    cap = cv2.VideoCapture(video_path)
    # Create a MediaPlayer object with the audio file path
    audio_player = MediaPlayer(audio_path)

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            break

        cv2.imshow('Video', frame)

        # Play audio
        audio_player.set_pause(False)

        if cv2.waitKey(30) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()
    # Close the audio player
    audio_player.set_pause(True)



# def play_video(video_path):
#     pygame.mixer.quit()  # Quit the audio mixer to play video
#     pygame.init()
#     pygame.display.set_caption("Video")
#     clock = pygame.time.Clock()
#     video = pygame.movie.Movie(video_path)
#     video_screen = pygame.display.set_mode(video.get_size())
#     video.set_display(video_screen)
#     video.play()



# main working video without audio

# def play_video(video_path):
#     cap = cv2.VideoCapture(video_path)
#
#     while cap.isOpened():
#         ret, frame = cap.read()
#         if not ret:
#             break
#
#         cv2.imshow('Video', frame)
#
#         if cv2.waitKey(30) & 0xFF == ord('q'):
#             break
#
#     cap.release()
#     cv2.destroyAllWindows()


# def play_video_with_audio(video_path, audio_path):
#     cap = cv2.VideoCapture(video_path)
#     audio = AudioSegment.from_file(audio_path)
#
#     while cap.isOpened():
#         ret, frame = cap.read()
#         if not ret:
#             break
#
#         cv2.imshow('Video', frame)
#
#         # Play audio
#         play(audio)
#
#         if cv2.waitKey(30) & 0xFF == ord('q'):
#             break
#
#     cap.release()
#     cv2.destroyAllWindows()


# def showVideo(file_path):
#     """Function to display video in Colab"""
#     mp4 = open(file_path,'rb').read()
#     data_url = "data:video/mp4;base64," + b64encode(mp4).decode()
#     display(HTML("""
#     <video controls width=600>
#         <source src="%s" type="video/mp4">
#     </video>
#     """ % data_url))


def request_gpt(prompt: str) -> str:
    """
    Send a prompt to the GPT-3 API and return the response.

    Args:
        - state: The current state of the app.
        - prompt: The prompt to send to the API.

    Returns:
        The response from the API.
    """
    response = gpt_client.chat.completions.create(
        messages=[
            {
                "role": "user",
                "content": f"{prompt}",
            }
        ],
        model="gpt-3.5-turbo",
    )
    return response.choices[0].message.content


async def transcribe(file_name: Union[Union[str, bytes, PathLike[str], PathLike[bytes]], int]):
    """
    Transcribe audio using Deepgram API.

    Args:
        - file_name: The name of the file to transcribe.

    Returns:
        The response from the API.
    """
    with open(file_name, "rb") as audio:
        source = {"buffer": audio, "mimetype": "audio/wav"}
        response = await deepgram.transcription.prerecorded(source)

        if response is not None and "results" in response and "channels" in response["results"]:
            alternative = response["results"]["channels"][0]["alternatives"][0]
            if "words" in alternative:
                return alternative["words"]

        # Handle the case where transcription failed or returned no results
        return None


def log(log: str):
    """
    Print and write to status.txt
    """
    print(log)
    with open("status.txt", "w") as f:
        f.write(log)


i = 0

if __name__ == "__main__":
    video_folder = "ques_video"
    while i < 5:
        log("Playing video...")
        video_path = os.path.join(video_folder, f"ques{i + 1}.mp4")
        audio_path = f"audio/question_{i+1}.wav"
        play_video_with_audio(video_path, audio_path)

        # log("Speaking...")
        # sound = mixer.Sound(f"audio/question_{i+1}.wav")
        # # Add response as a new line to conv.txt
        # with open("conv.txt", "a") as f:
        #     f.write(f"{questions_text[i]}\n")
        # sound.play()
        # pygame.time.wait(int(sound.get_length() * 1000))
        # print(f"JARVIS: {questions_text[i]}\n")

        # Record audio
        log("Listening...")
        speech_to_text()
        log("Done listening")

        # Transcribe audio
        current_time = time()
        loop = asyncio.new_event_loop()
        asyncio.set_event_loop(loop)
        words = loop.run_until_complete(transcribe(RECORDING_PATH))
        string_words = " ".join(
            word_dict.get("word") for word_dict in words if "word" in word_dict
        )
        with open("response.txt", "a") as f:
            f.write(f"{string_words}\n")
        transcription_time = time() - current_time
        log(f"Finished transcribing in {transcription_time:.2f} seconds.")

        i += 1
