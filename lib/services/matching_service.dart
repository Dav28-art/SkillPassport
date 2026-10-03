
class MatchingService {
  Map<String, dynamic> calculateMatch({
    required List<String> userSkills,
    required List<String> requiredSkills,
  }) {
    final userSkillsLower =
        userSkills.map((skill) => skill.toLowerCase()).toSet();

    final matchedSkills = requiredSkills
        .where((skill) => userSkillsLower.contains(skill.toLowerCase()))
        .toList();

    final missingSkills = requiredSkills
        .where((skill) => !userSkillsLower.contains(skill.toLowerCase()))
        .toList();

    final score = requiredSkills.isEmpty
        ? 0.0
        : (matchedSkills.length / requiredSkills.length) * 100;

    return {
      'score': score,
      'matchedSkills': matchedSkills,
      'missingSkills': missingSkills,
    };
  }
}

