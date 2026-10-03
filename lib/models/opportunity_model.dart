import 'package:cloud_firestore/cloud_firestore.dart';

class OpportunityModel {
  final String id;
  final String title;
  final String company;
  final String description;
  final String type;
  final String location;
  final List<String> requiredSkills;
  final String? applicationUrl;
  final DateTime? deadline;
  final DateTime? createdAt;

  const OpportunityModel({
    required this.id,
    required this.title,
    required this.company,
    required this.description,
    required this.type,
    required this.location,
    required this.requiredSkills,
    this.applicationUrl,
    this.deadline,
    this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'company': company,
        'description': description,
        'type': type,
        'location': location,
        'requiredSkills': requiredSkills,
        'applicationUrl': applicationUrl,
        'deadline': deadline,
        'createdAt': createdAt,
      };

  factory OpportunityModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return OpportunityModel(
      id: id,
      title: map['title'] ?? '',
      company: map['company'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? '',
      location: map['location'] ?? '',
      requiredSkills: List<String>.from(
        map['requiredSkills'] ?? [],
      ),
      applicationUrl: map['applicationUrl'],
      deadline: (map['deadline'] as Timestamp?)?.toDate(),
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
    );
  }
}