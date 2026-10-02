import 'package:flutter/material.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../skill_passport/presentation/pages/skill_passport_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillPassport Africa'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Bonjour 👋',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Bienvenue sur votre SkillPassport.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),

          _DashboardCard(
            title: 'Mon SkillPassport',
            subtitle: 'Compétences, projets et expériences',
            icon: Icons.badge_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SkillPassportPage(),
                ),
              );
            },
          ),

          _DashboardCard(
            title: 'Profil',
            subtitle: 'Consultez et modifiez votre profil',
            icon: Icons.person_outline,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),

          _DashboardCard(
            title: 'Skill Gap',
            subtitle: 'Découvrez les compétences à développer',
            icon: Icons.analytics_outlined,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('La page Skill Gap sera ajoutée bientôt.'),
                ),
              );
            },
          ),

          _DashboardCard(
            title: 'Opportunités',
            subtitle: 'Trouvez des opportunités adaptées',
            icon: Icons.work_outline,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('La page Opportunités sera ajoutée bientôt.'),
                ),
              );
            },
          ),

          _DashboardCard(
            title: 'Matching',
            subtitle: 'Découvrez votre compatibilité',
            icon: Icons.auto_awesome_outlined,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('La page Matching sera ajoutée bientôt.'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}