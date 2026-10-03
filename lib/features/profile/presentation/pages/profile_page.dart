import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Mon Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 55,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Mon Profil',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Développeur Web',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text('Modifier le profil'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            'Informations personnelles',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _InfoCard(
            icon: Icons.person_outline,
            title: 'Nom',
            value: 'Mon nom',
          ),

          _InfoCard(
            icon: Icons.email_outlined,
            title: 'Email',
            value: 'monemail@example.com',
          ),

          _InfoCard(
            icon: Icons.location_on_outlined,
            title: 'Localisation',
            value: 'Burundi',
          ),

          const SizedBox(height: 20),

          const Text(
            'Mes compétences',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              Chip(
                avatar: Icon(Icons.code, size: 18),
                label: Text('HTML'),
              ),
              Chip(
                avatar: Icon(Icons.code, size: 18),
                label: Text('CSS'),
              ),
              Chip(
                avatar: Icon(Icons.javascript, size: 18),
                label: Text('JavaScript'),
              ),
              Chip(
                avatar: Icon(Icons.flutter_dash, size: 18),
                label: Text('Flutter'),
              ),
              Chip(
                avatar: Icon(Icons.storage, size: 18),
                label: Text('Git'),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'Mes projets',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _ProjectCard(
            title: 'SkillPassport Africa',
            description:
                'Application permettant aux jeunes de valoriser leurs compétences.',
          ),

          _ProjectCard(
            title: 'Projet Flutter',
            description:
                'Application mobile développée avec Flutter.',
          ),

          const SizedBox(height: 20),

          const Text(
            'Mes formations',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _InfoCard(
            icon: Icons.school_outlined,
            title: 'Formation',
            value: 'Informatique',
          ),

          _InfoCard(
            icon: Icons.school,
            title: 'Institution',
            value: 'ITN',
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(value),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const _ProjectCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.folder_outlined),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}