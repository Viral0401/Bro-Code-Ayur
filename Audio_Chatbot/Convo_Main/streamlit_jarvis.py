import streamlit as st
from main2 import play_video_with_audio, speech_to_text, transcribe, log

st.title("Interactive Jarvis")

questions_text = [
    "Hello! May I know your name?",
    # Add other questions as needed
]

i = 0

while i < len(questions_text):
    st.subheader(f"Question {i + 1}")
    st.write(questions_text[i])

    # Play video
    video_path = f"ques_video/ques{i + 1}.mp4"
    audio_path = f"audio/question_{i+1}.wav"
    play_video_with_audio(video_path, audio_path)
    st.video(video_path)

    # Record audio
    st.write("Click the button below and speak your answer:")
    if st.button("Record Answer"):
        speech_to_text()
        st.success("Recording done!")

        # Transcribe audio
        current_time = time()
        words = transcribe("audio/recording.wav")
        string_words = " ".join(
            word_dict.get("word") for word_dict in words if "word" in word_dict
        )

        st.write("Transcription:")
        st.write(string_words)
        transcription_time = time() - current_time
        st.success(f"Transcribed in {transcription_time:.2f} seconds.")

        # Additional processing or logging can be done here
        log("Additional processing or logging...")

        i += 1
