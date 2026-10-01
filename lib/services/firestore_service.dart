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

  /// Crée ou remplace le profil d'un utilisateur.
  Future<void> createUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await users.doc(userId).set(data);
  }

  /// Récupère le profil d'un utilisateur.
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(
    String userId,
  ) async {
    return users.doc(userId).get();
  }

  /// Met à jour le profil d'un utilisateur.
  Future<void> updateUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    await users.doc(userId).update(data);
  }
}