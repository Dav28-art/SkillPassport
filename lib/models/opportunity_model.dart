class OpportunityModel {
  final String id;
  final String title;
  final String company;
  final String country;
  final String type;
  final String description;
  final List<String> requiredSkills;
  final bool remote;

  const OpportunityModel({
    required this.id,
    required this.title,
    required this.company,
    required this.country,
    required this.type,
    required this.description,
    required this.requiredSkills,
    required this.remote,
  });
}
