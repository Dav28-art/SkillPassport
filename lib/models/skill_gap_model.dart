class SkillGapModel {
  final String userId;
  final List<String> missingSkills;
  final List<String> recommendations;

  SkillGapModel({
    required this.userId,
    required this.missingSkills,
    required this.recommendations,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'missingSkills': missingSkills,
      'recommendations': recommendations,
    };
  }

  factory SkillGapModel.fromMap(Map<String, dynamic> map) {
    return SkillGapModel(
      userId: map['userId'] ?? '',
      missingSkills: List<String>.from(map['missingSkills'] ?? []),
      recommendations: List<String>.from(map['recommendations'] ?? []),
    );
  }
}
