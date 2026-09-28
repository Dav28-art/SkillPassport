import 'package:flutter/material.dart';

import '../widgets/welcome_header.dart';
import '../widgets/profile_completion_card.dart';
import '../widgets/skill_summary_card.dart';
import '../widgets/skill_gap_card.dart';
import '../widgets/opportunity_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // Données temporaires pour le MVP.
  // Elles seront remplacées par Firebase plus tard.
  final List<Map<String, dynamic>> _skills = [
    {
      'name': 'Flutter',
      'level': 85,
    },
    {
      'name': 'Firebase',
      'level': 70,
    },
    {
      'name': 'JavaScript',
      'level': 80,
    },
    {
      'name': 'Git',
      'level': 90,
    },
  ];

  final List<String> _missingSkills = [
    'Node.js',
    'PostgreSQL',
    'Docker',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillPassport Africa'),
        centerTitle: false,
      ),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            // Plus tard :
            // récupérer les données Firebase.
            await Future.delayed(
              const Duration(milliseconds: 500),
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bienvenue
                const WelcomeHeader(
                  name: 'David',
                  role: 'Full Stack Developer',
                ),

                const SizedBox(height: 20),

                // Profil
                const ProfileCompletionCard(
                  completion: 0.80,
                ),

                const SizedBox(height: 20),

                // Compétences
                SkillSummaryCard(
                  skills: _skills,
                ),

                const SizedBox(height: 20),

                // Skill Gap
                SkillGapCard(
                  missingSkills: _missingSkills,
                ),

                const SizedBox(height: 20),

                // Section opportunités
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Opportunités pour vous',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Voir tout'),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Opportunité 1
                const OpportunityCard(
                  title: 'Flutter Developer',
                  company: 'Tech Africa',
                  location: 'Afrique / Remote',
                  matchPercentage: 91,
                  remote: true,
                ),

                // Opportunité 2
                const OpportunityCard(
                  title: 'Full Stack Developer',
                  company: 'Digital Africa',
                  location: 'Lomé, Togo',
                  matchPercentage: 84,
                  remote: false,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.badge_outlined),
            selectedIcon: Icon(Icons.badge),
            label: 'Passport',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: 'Opportunités',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}