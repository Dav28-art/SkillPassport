
import 'package:flutter/material.dart';

class SkillPassportPage extends StatelessWidget {
  const SkillPassportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon SkillPassport'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Mon passeport numérique',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            icon: Icons.code,
            title: 'Mes compétences',
            subtitle: 'Ajoutez vos compétences techniques et personnelles.',
          ),
          _buildSection(
            icon: Icons.folder,
            title: 'Mes projets',
            subtitle: 'Présentez vos réalisations.',
          ),
          _buildSection(
            icon: Icons.school,
            title: 'Mes formations',
            subtitle: 'Ajoutez vos formations et certifications.',
          ),
          _buildSection(
            icon: Icons.work,
            title: 'Mes expériences',
            subtitle: 'Présentez vos expériences professionnelles.',
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}