import 'dart:convert';
import '../../../models/opportunity_model.dart';
import '../../../services/ai_service.dart';

Future<void> testAnalyzeAndMatch() async {
  final aiService = AiService();

  // Compétences de l'utilisateur
  final userSkills = [
    {
      'name': 'JavaScript',
      'level': 4,
    },
    {
      'name': 'HTML',
      'level': 4,
    },
    {
      'name': 'CSS',
      'level': 3,
    },
    {
      'name': 'Git',
      'level': 3,
    },
  ];

  // Projet de l'utilisateur
  final projects = [
    {
      'title': 'Portfolio web',
      'technologies': [
        'HTML',
        'CSS',
        'JavaScript',
      ],
    },
  ];

  // Opportunité
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

  // Analyse complète
  final result = await aiService.analyzeAndMatch(
    userId: 'user_001',
    careerGoal: 'Développeur Full Stack',
    skills: userSkills,
    projects: projects,
    opportunity: opportunity,
  );

 print('========== RESULTAT JSON ==========');

const encoder = JsonEncoder.withIndent('  ');
print(encoder.convert(result));
}

void main() async {
  await testAnalyzeAndMatch();
}