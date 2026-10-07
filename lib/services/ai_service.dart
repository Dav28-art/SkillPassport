import '../models/match_model.dart';
import '../models/opportunity_model.dart';

class AiService {
  /// Analyse le profil de l'utilisateur.
  ///
  /// Retourne un résultat structuré utilisable par l'application.
  Future<Map<String, dynamic>> analyzeProfile({
    required String careerGoal,
    required List<Map<String, dynamic>> skills,
    required List<Map<String, dynamic>> projects,
  }) async {
    // Récupérer les noms des compétences
    final skillNames = skills
        .map((skill) => skill['name']?.toString() ?? '')
        .where((name) => name.isNotEmpty)
        .toList();

    // Déterminer les points forts
    final strengths = skills
        .where((skill) {
          final level = skill['level'] ?? 0;
          return level >= 3;
        })
        .map((skill) => skill['name']?.toString() ?? '')
        .where((name) => name.isNotEmpty)
        .toList();

    // Compétences recommandées selon l'objectif
    final recommendations = <String>[];
    final missingSkills = <String>[];

    if (careerGoal.toLowerCase().contains('full stack')) {
      const recommendedSkills = [
        'Node.js',
        'SQL',
        'Docker',
      ];

      for (final skill in recommendedSkills) {
        final exists = skillNames.any(
          (userSkill) => userSkill.toLowerCase() == skill.toLowerCase(),
        );

        if (!exists) {
          missingSkills.add(skill);
          recommendations.add('Apprendre $skill');
        }
      }
    }

    // Déterminer le niveau approximatif
    String currentLevel = 'Débutant';

    if (skillNames.length >= 5) {
      currentLevel = 'Intermédiaire';
    }

    if (skillNames.length >= 8) {
      currentLevel = 'Avancé';
    }

    return {
      'careerGoal': careerGoal,
      'currentLevel': currentLevel,
      'strengths': strengths,
      'missingSkills': missingSkills,
      'recommendations': recommendations,
      'projectsCount': projects.length,
    };
  }

  /// Calcule le score de compatibilité avec une opportunité.
  Future<Map<String, dynamic>> calculateMatch({
    required String userId,
    required String opportunityId,
    required List<String> userSkills,
    required List<String> requiredSkills,
  }) async {
    if (requiredSkills.isEmpty) {
      return {
        'userId': userId,
        'opportunityId': opportunityId,
        'score': 0.0,
        'matchedSkills': <String>[],
        'missingSkills': <String>[],
      };
    }

    final userSet = userSkills
        .map((skill) => skill.toLowerCase().trim())
        .toSet();

    final matchedSkills = requiredSkills.where((skill) {
      return userSet.contains(skill.toLowerCase().trim());
    }).toList();

    final missingSkills = requiredSkills.where((skill) {
      return !userSet.contains(skill.toLowerCase().trim());
    }).toList();

    final score =
        (matchedSkills.length / requiredSkills.length) * 100;

    return {
      'userId': userId,
      'opportunityId': opportunityId,
      'score': score,
      'matchedSkills': matchedSkills,
      'missingSkills': missingSkills,
    };
  }

  /// Crée un objet MatchModel à partir du résultat du matching.
  Future<MatchModel> createMatch({
    required String userId,
    required String opportunityId,
    required List<String> userSkills,
    required List<String> requiredSkills,
  }) async {
    final result = await calculateMatch(
      userId: userId,
      opportunityId: opportunityId,
      userSkills: userSkills,
      requiredSkills: requiredSkills,
    );

    return MatchModel(
      userId: result['userId'] as String,
      opportunityId: result['opportunityId'] as String,
      score: (result['score'] as num).toDouble(),
      matchedSkills: List<String>.from(result['matchedSkills']),
      missingSkills: List<String>.from(result['missingSkills']),
    );
  }
 Future<MatchModel> matchWithOpportunity({
  required String userId,
  required List<String> userSkills,
  required OpportunityModel opportunity,
}) async {
  return createMatch(
    userId: userId,
    opportunityId: opportunity.id,
    userSkills: userSkills,
    requiredSkills: opportunity.requiredSkills,
  );
}
 Future<Map<String, dynamic>> analyzeAndMatch({
  required String userId,
  required String careerGoal,
  required List<Map<String, dynamic>> skills,
  required List<Map<String, dynamic>> projects,
  required OpportunityModel opportunity,
}) async {
  // 1. Analyse du profil
  final analysis = await analyzeProfile(
    careerGoal: careerGoal,
    skills: skills,
    projects: projects,
  );

  // 2. Récupérer les noms des compétences
  final userSkills = skills
      .map((skill) => skill['name']?.toString() ?? '')
      .where((name) => name.isNotEmpty)
      .toList();

  // 3. Calcul du matching
  final match = await matchWithOpportunity(
    userId: userId,
    userSkills: userSkills,
    opportunity: opportunity,
  );

  // 4. Résultat structuré
  return {
    'profileAnalysis': {
      'careerGoal': analysis['careerGoal'],
      'currentLevel': analysis['currentLevel'],
      'strengths': analysis['strengths'],
      'projectsCount': analysis['projectsCount'],
    },
    'skillGap': {
      'missingSkills': analysis['missingSkills'],
      'recommendations': analysis['recommendations'],
    },
    'matching': {
      'opportunityId': match.opportunityId,
      'score': match.score,
      'matchedSkills': match.matchedSkills,
      'missingSkills': match.missingSkills,
    },
  };
}
}