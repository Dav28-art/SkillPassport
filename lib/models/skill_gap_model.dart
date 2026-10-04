import 'package:cloud_firestore/cloud_firestore.dart';

class SkillGapModel {
  final String id;
  final String userId;
  final List<String> missingSkills;
  final List<String> recommendations;
  final DateTime? createdAt;

  const SkillGapModel({
    this.id = '',
    required this.userId,
    required this.missingSkills,
    required this.recommendations,
    this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'missingSkills': missingSkills,
        'recommendations': recommendations,
        'createdAt': createdAt,
      };

  factory SkillGapModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return SkillGapModel(
      id: id,
      userId: map['userId'] ?? '',
      missingSkills: List<String>.from(map['missingSkills'] ?? []),
      recommendations: List<String>.from(map['recommendations'] ?? []),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
    );
  }
}
