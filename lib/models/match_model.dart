
class MatchModel {
  final String userId;
  final String opportunityId;
  final double score;
  final List<String> matchedSkills;
  final List<String> missingSkills;

  MatchModel({
    required this.userId,
    required this.opportunityId,
    required this.score,
    required this.matchedSkills,
    required this.missingSkills,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'opportunityId': opportunityId,
      'score': score,
      'matchedSkills': matchedSkills,
      'missingSkills': missingSkills,
    };
  }

  factory MatchModel.fromMap(Map<String, dynamic> map) {
    return MatchModel(
      userId: map['userId'] ?? '',
      opportunityId: map['opportunityId'] ?? '',
      score: (map['score'] ?? 0).toDouble(),
      matchedSkills: List<String>.from(map['matchedSkills'] ?? []),
      missingSkills: List<String>.from(map['missingSkills'] ?? []),
    );
  }
}