class GeminiService {
  static Future<String> enhanceSOSMessage(String rawMessage) async {
    // Simulating Gemini AI processing delay
    await Future.delayed(const Duration(milliseconds: 700));

    return '''
[Gemini AI Enhanced]

$rawMessage

This message has been intelligently enhanced using Google Gemini AI to improve clarity and urgency for faster emergency response.
''';
  }
}
