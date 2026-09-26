import 'package:flutter/material.dart';

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
        children: const [
          _DashboardCard(
            title: 'Mon SkillPassport',
            subtitle: 'Compétences, projets et expériences',
            icon: Icons.badge_outlined,
          ),
          _DashboardCard(
            title: 'Skill Gap',
            subtitle: 'Découvrez les compétences à développer',
            icon: Icons.analytics_outlined,
          ),
          _DashboardCard(
            title: 'Opportunités',
            subtitle: 'Trouvez des opportunités adaptées',
            icon: Icons.work_outline,
          ),
          _DashboardCard(
            title: 'Matching',
            subtitle: 'Voyez votre compatibilité avec les opportunités',
            icon: Icons.auto_awesome_outlined,
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

  const _DashboardCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
