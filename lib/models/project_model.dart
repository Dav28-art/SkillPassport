class ProjectModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String? technologies;
  final String? projectUrl;
  final DateTime? createdAt;

  const ProjectModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    this.technologies,
    this.projectUrl,
    this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'title': title,
        'description': description,
        'technologies': technologies,
        'projectUrl': projectUrl,
        'createdAt': createdAt,
      };

  factory ProjectModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return ProjectModel(
      id: id,
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      technologies: map['technologies'],
      projectUrl: map['projectUrl'],
      createdAt: map['createdAt']?.toDate(),
    );
  }
}