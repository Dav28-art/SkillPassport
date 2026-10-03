import 'package:cloud_firestore/cloud_firestore.dart';

class MatchModel {
  final String id;
  final String userId;
  final String opportunityId;
  final double score;
  final List<String> matchedSkills;
  final List<String> missingSkills;
  final DateTime? createdAt;

  const MatchModel({
    this.id = '',
    required this.userId,
    required this.opportunityId,
    required this.score,
    required this.matchedSkills,
    required this.missingSkills,
    this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'opportunityId': opportunityId,
        'score': score,
        'matchedSkills': matchedSkills,
        'missingSkills': missingSkills,
        'createdAt': createdAt,
      };

  factory MatchModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return MatchModel(
      id: id,
      userId: map['userId'] ?? '',
      opportunityId: map['opportunityId'] ?? '',
      score: (map['score'] ?? 0).toDouble(),
      matchedSkills: List<String>.from(map['matchedSkills'] ?? []),
      missingSkills: List<String>.from(map['missingSkills'] ?? []),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
    );
  }
}
