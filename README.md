# – Your Personal AI Voice Assistant 🤖🎙️

Friday is an intelligent voice assistant built with **Flutter** that combines the power of **OpenAI's ChatGPT and DALL·E** to enable natural conversations and AI image generation through voice commands.

---

## ✨ Features

- 🎤 **Voice-to-Text Input** using speech recognition
- 💬 **ChatGPT Integration** for dynamic conversation
- 🖼️ **DALL·E Integration** to generate images from spoken prompts
- 🌐 Modern, clean Flutter UI
- 📱 Fully responsive mobile experience

---

## 🚀 Tech Stack

- **Flutter** (Dart)
- **speech_to_text** – for converting speech to text
- **openai** – for ChatGPT & DALL·E API access
- **provider** – for state management
- **http** – for API communication

## 🛠️ Setup Instructions

1. **Clone the repository**
`bash`
git clone https://github.com/your-username/verbo.git
cd verbo

2. Install dependencies
   flutter pub get

3. Add your OpenAI API key
   Create a .env file or directly replace the placeholder in your code:
   const openAIKey = 'YOUR_OPENAI_API_KEY';

4. Run the app
   flutter run


# How It Works
User taps mic and speaks a query
The app converts speech to text using speech_to_text
The text is sent to OpenAI's ChatGPT (for text) or DALL·E (for image generation)
The AI's response is displayed, and images are rendered if requested

   


   
