import 'package:flutter/material.dart';
import 'preview.dart';
import 'lock_screen.dart';
import 'medical_profile.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('SILENT SOS'),
  centerTitle: true,
  actions: [
    IconButton(
  icon: const Icon(Icons.lock),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LockScreenEmergency(),
      ),
    );
  },
),

    IconButton(
      icon: const Icon(Icons.medical_information),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const MedicalProfileScreen(),
          ),
        );
      },
    )
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            sosCard(context, Icons.local_hospital, 'Medical',
                'I need medical help. I am unable to speak.'),
            sosCard(context, Icons.local_police, 'Police',
                'I am in danger and need police assistance.'),
            sosCard(context, Icons.fire_extinguisher, 'Fire',
                'There is a fire emergency. Please send help.'),
            sosCard(context, Icons.healing, 'Injury',
                'I am injured and need immediate help.'),
          ],
        ),
      ),
    );
  }

  Widget sosCard(BuildContext context, IconData icon, String title, String msg) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PreviewScreen(title: title, message: msg),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade700,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
