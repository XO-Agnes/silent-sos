import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LockScreenEmergency extends StatefulWidget {
  const LockScreenEmergency({super.key});

  @override
  State<LockScreenEmergency> createState() => _LockScreenEmergencyState();
}

class _LockScreenEmergencyState extends State<LockScreenEmergency> {
  String name = 'N/A';
  String blood = 'N/A';
  String conditions = 'N/A';

  @override
  void initState() {
    super.initState();
    loadMedicalInfo();
  }

  Future<void> loadMedicalInfo() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString('name') ?? 'N/A';
      blood = prefs.getString('blood') ?? 'N/A';
      conditions = prefs.getString('conditions') ?? 'N/A';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Emergency Access'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LOCK SCREEN EMERGENCY MODE',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Accessible when the user is unconscious or unable to respond.',
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'MEDICAL INFO',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text('Name: $name',
                      style: const TextStyle(color: Colors.white70)),
                  Text('Blood Group: $blood',
                      style: const TextStyle(color: Colors.white70)),
                  Text('Condition: $conditions',
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 56),
              ),
              onPressed: () {},
              child: const Text('SEND EMERGENCY ALERT'),
            ),
          ],
        ),
      ),
    );
  }
}
