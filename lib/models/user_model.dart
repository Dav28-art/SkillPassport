class UserModel {
  final String id;
  final String name;
  final String email;
  final String country;
  final String? city;
  final String? photoUrl;
  final String? cvUrl;
  final String? bio;
  final String? careerGoal;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.country,
    this.city,
    this.photoUrl,
    this.cvUrl,
    this.bio,
    this.careerGoal,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'country': country,
        'city': city,
        'photoUrl': photoUrl,
        'cvUrl': cvUrl,
        'bio': bio,
        'careerGoal': careerGoal,
      };

  factory UserModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return UserModel(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      country: map['country'] ?? '',
      city: map['city'],
      photoUrl: map['photoUrl'],
      cvUrl: map['cvUrl'],
      bio: map['bio'],
      careerGoal: map['careerGoal'],
    );
  }
}