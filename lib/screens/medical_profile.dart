import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalProfileScreen extends StatefulWidget {
  const MedicalProfileScreen({super.key});

  @override
  State<MedicalProfileScreen> createState() => _MedicalProfileScreenState();
}

class _MedicalProfileScreenState extends State<MedicalProfileScreen> {
  final name = TextEditingController();
  final blood = TextEditingController();
  final allergies = TextEditingController();
  final conditions = TextEditingController();
  final contact = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    name.text = prefs.getString('name') ?? '';
    blood.text = prefs.getString('blood') ?? '';
    allergies.text = prefs.getString('allergies') ?? '';
    conditions.text = prefs.getString('conditions') ?? '';
    contact.text = prefs.getString('contact') ?? '';
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name.text);
    await prefs.setString('blood', blood.text);
    await prefs.setString('allergies', allergies.text);
    await prefs.setString('conditions', conditions.text);
    await prefs.setString('contact', contact.text);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medical profile saved')),
      );
    }
  }

  Widget field(String label, TextEditingController c) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
  controller: c,
  style: const TextStyle(color: Colors.white),
  decoration: InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.white70),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white54),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    ),
  ),
)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medical Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            field('Full Name', name),
            field('Blood Group', blood),
            field('Allergies', allergies),
            field('Medical Conditions', conditions),
            field('Emergency Contact', contact),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveData,
              child: const Text('SAVE PROFILE'),
            ),
          ],
        ),
      ),
    );
  }
}
