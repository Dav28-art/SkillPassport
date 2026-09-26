class MatchModel {
  final String userId;
  final String opportunityId;
  final double score;
  final List<String> matchedSkills;
  final List<String> missingSkills;

  const MatchModel({
    required this.userId,
    required this.opportunityId,
    required this.score,
    required this.matchedSkills,
    required this.missingSkills,
  });
}
