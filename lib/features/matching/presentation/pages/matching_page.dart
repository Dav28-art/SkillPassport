import 'package:flutter/material.dart';

import '../../../../models/opportunity_model.dart';
import '../../../../services/ai_service.dart';

class MatchingPage extends StatelessWidget {
  const MatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final aiService = AiService();

    final userSkills = [
      {'name': 'JavaScript', 'level': 4},
      {'name': 'HTML', 'level': 4},
      {'name': 'CSS', 'level': 3},
      {'name': 'Git', 'level': 3},
    ];

    final projects = [
      {
        'title': 'Portfolio web',
        'technologies': ['HTML', 'CSS', 'JavaScript'],
      },
    ];

    final opportunity = OpportunityModel(
      id: 'opp_001',
      title: 'Développeur Full Stack',
      company: 'Tech Africa',
      country: 'Sénégal',
      type: 'Stage',
      description: 'Stage développeur Full Stack',
      requiredSkills: [
        'JavaScript',
        'Git',
        'Node.js',
        'SQL',
        'Docker',
      ],
      remote: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('IA / Matching'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: aiService.analyzeAndMatch(
          userId: 'user_001',
          careerGoal: 'Développeur Full Stack',
          skills: userSkills,
          projects: projects,
          opportunity: opportunity,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur : ${snapshot.error}',
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('Aucun résultat disponible'),
            );
          }

          final result = snapshot.data!;

          final profileAnalysis =
              result['profileAnalysis'] as Map<String, dynamic>;

          final skillGap =
              result['skillGap'] as Map<String, dynamic>;

          final matching =
              result['matching'] as Map<String, dynamic>;

          final careerGoal =
              profileAnalysis['careerGoal'] as String;

          final currentLevel =
              profileAnalysis['currentLevel'] as String;

          final strengths =
              List<String>.from(profileAnalysis['strengths']);

          final missingSkills =
              List<String>.from(skillGap['missingSkills']);

          final recommendations =
              List<String>.from(skillGap['recommendations']);

          final score =
              (matching['score'] as num).toDouble();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Analyse du profil',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Objectif professionnel',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(careerGoal),

                const SizedBox(height: 16),

                Text(
                  'Niveau : $currentLevel',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Points forts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: strengths
                      .map(
                        (skill) => Chip(
                          label: Text(skill),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Compétences manquantes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: missingSkills
                      .map(
                        (skill) => Chip(
                          label: Text(skill),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Recommandations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                ...recommendations.map(
                  (recommendation) => ListTile(
                    leading: const Icon(Icons.school),
                    title: Text(recommendation),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Score de compatibilité',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                LinearProgressIndicator(
                  value: score / 100,
                  minHeight: 12,
                ),

                const SizedBox(height: 8),

                Text(
                  '${score.toStringAsFixed(0)} %',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}