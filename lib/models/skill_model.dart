class SkillModel {
  final String name;
  final int level;
  final bool verified;

  const SkillModel({
    required this.name,
    required this.level,
    this.verified = false,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'level': level,
        'verified': verified,
      };

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      name: map['name'] ?? '',
      level: (map['level'] ?? 0) as int,
      verified: map['verified'] ?? false,
    );
  }
}
