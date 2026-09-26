class ProjectModel {
  final String id;
  final String userId;
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? imageUrl;

  const ProjectModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.imageUrl,
  });
}
