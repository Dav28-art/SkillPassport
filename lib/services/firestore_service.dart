import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get users =>
      _db.collection('users');

  CollectionReference<Map<String, dynamic>> get skills =>
      _db.collection('skills');

  CollectionReference<Map<String, dynamic>> get projects =>
      _db.collection('projects');

  CollectionReference<Map<String, dynamic>> get opportunities =>
      _db.collection('opportunities');

  CollectionReference<Map<String, dynamic>> get applications =>
      _db.collection('applications');

  CollectionReference<Map<String, dynamic>> get skillGaps =>
      _db.collection('skillGaps');

  CollectionReference<Map<String, dynamic>> get matches =>
      _db.collection('matches');

  // ==================== USERS ====================

  Future<void> createUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await users.doc(userId).set(data);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(
    String userId,
  ) async {
    return users.doc(userId).get();
  }

  Future<void> updateUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await users.doc(userId).update(data);
  }

  // ==================== PROJECTS ====================

  Future<void> createProject({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await projects.add({
      ...data,
      'userId': userId,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserProjects(
    String userId,
  ) async {
    return projects.where('userId', isEqualTo: userId).get();
  }

  Future<void> updateProject({
    required String projectId,
    required Map<String, dynamic> data,
  }) async {
    await projects.doc(projectId).update(data);
  }

  Future<void> deleteProject(String projectId) async {
    await projects.doc(projectId).delete();
  }

  // ==================== SKILLS ====================

  Future<void> createSkill({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await skills.add({
      ...data,
      'userId': userId,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserSkills(
    String userId,
  ) async {
    return skills.where('userId', isEqualTo: userId).get();
  }

  Future<void> updateSkill({
    required String skillId,
    required Map<String, dynamic> data,
  }) async {
    await skills.doc(skillId).update(data);
  }

  Future<void> deleteSkill(String skillId) async {
    await skills.doc(skillId).delete();
  }
}