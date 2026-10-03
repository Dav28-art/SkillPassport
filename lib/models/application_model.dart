import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationModel {
  final String id;
  final String userId;
  final String opportunityId;
  final String status;
  final DateTime? appliedAt;
  final DateTime? updatedAt;

  const ApplicationModel({
    required this.id,
    required this.userId,
    required this.opportunityId,
    required this.status,
    this.appliedAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'opportunityId': opportunityId,
        'status': status,
        'appliedAt': appliedAt,
        'updatedAt': updatedAt,
      };

  factory ApplicationModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return ApplicationModel(
      id: id,
      userId: map['userId'] ?? '',
      opportunityId: map['opportunityId'] ?? '',
      status: map['status'] ?? 'pending',
      appliedAt: (map['appliedAt'] as Timestamp?)?.toDate(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate(),
    );
  }
}