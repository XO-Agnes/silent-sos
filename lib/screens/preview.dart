import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/location_service.dart';
import '../services/gemini_service.dart';


class PreviewScreen extends StatefulWidget {
  final String title;
  final String message;

  const PreviewScreen({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  String finalMessage = '';
  bool loading = true;

  @override
  void initState() {
    super.initState();
    prepareMessage();
  }

  Future<void> prepareMessage() async {
  final prefs = await SharedPreferences.getInstance();

  final medicalInfo = '''
Name: ${prefs.getString('name') ?? 'N/A'}
Blood Group: ${prefs.getString('blood') ?? 'N/A'}
Allergies: ${prefs.getString('allergies') ?? 'N/A'}
Medical Conditions: ${prefs.getString('conditions') ?? 'N/A'}
Emergency Contact: ${prefs.getString('contact') ?? 'N/A'}
''';

  final locationLink = await LocationService.getGoogleMapsLink();

  final baseMessage =
      '${widget.message}\n\nMEDICAL INFO:\n$medicalInfo';

  final enhancedMessage =
      await GeminiService.enhanceSOSMessage(baseMessage);

  setState(() {
    finalMessage = enhancedMessage;

    if (locationLink != null) {
      finalMessage += '\n\nLocation: $locationLink';
    }

    loading = false;
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.black,
  foregroundColor: Colors.white,
  title: Text('${widget.title} Emergency'),
),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Text(
                      finalMessage,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'SOS ready with Google Maps location',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'SEND HELP',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
