import 'dart:convert';
import 'package:friday/api.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey = 'AIzaSyCrKlbwkERtHFUK-b6Y_usntHToEzmguv4';
  final String geminiUrl = 'https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent';
  // Function to determine if the prompt is for image generation
  Future<String> isArtPromptAPI(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('$geminiUrl?key=$apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [{"text": "Does this message want to generate an AI picture, image, art, or anything similar? $prompt. Simply answer with a yes or no."}]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final resultText = data['candidates'][0]['content']['parts'][0]['text'];
        return resultText.toLowerCase().contains("yes") ? "DALL-E" : "ChatGPT";
        
      }else{
      return 'Error: ${response.body}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  // Function for text generation using Gemini API
  Future<String> chatGPTAPI(String prompt) async {
    return await _sendTextToGemini(prompt);
  }
  Future<String> dallEAPI(String prompt) async {
    return await _sendTextToGemini("Generate a detailed description for an AI image of: $prompt");
  }

  // Function for image generation using Gemini API
  Future<String> _sendTextToGemini(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('$geminiUrl?key=$apiKey'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {"parts": [{"text": prompt}]}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        return "Error: ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
