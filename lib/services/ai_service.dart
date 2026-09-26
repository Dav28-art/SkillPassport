class AiService {
  /// Point d'entrée pour l'analyse IA.
  ///
  /// Plus tard, cette méthode appellera votre backend/API IA.
  /// Ne mettez pas une clé API secrète directement dans l'application Flutter.
  Future<Map<String, dynamic>> analyzeProfile({
    required String careerGoal,
    required List<Map<String, dynamic>> skills,
    required List<Map<String, dynamic>> projects,
  }) async {
    // TODO: connecter au backend IA.
    return {
      'currentLevel': 'Junior',
      'strengths': <String>[],
      'missingSkills': <String>[],
      'recommendations': <String>[],
    };
  }

  Future<double> calculateMatch({
    required List<String> userSkills,
    required List<String> requiredSkills,
  }) async {
    if (requiredSkills.isEmpty) return 0;

    final userSet = userSkills.map((e) => e.toLowerCase()).toSet();
    final matched =
        requiredSkills.where((s) => userSet.contains(s.toLowerCase())).length;

    return matched / requiredSkills.length * 100;
  }
}
