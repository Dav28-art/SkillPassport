import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/skill_model.dart';


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
 Future<UserModel?> getUser(String userId) async {
  final doc = await users.doc(userId).get();

  if (!doc.exists || doc.data() == null) {
    return null;
  }

  return UserModel.fromMap(doc.id, doc.data()!);
}
Future<List<SkillModel>> getUserSkills(String userId) async {
  final snapshot = await skills
      .where('userId', isEqualTo: userId)
      .get();

  return snapshot.docs
      .map((doc) => SkillModel.fromMap(doc.data()))
      .toList();
} 
 Future<void> saveMatch(Map<String, dynamic> match) async {
  await matches.add({
    ...match,
    'createdAt': FieldValue.serverTimestamp(),
  });
}
 Future<void> saveSkillGap(Map<String, dynamic> skillGap) async {
  await skillGaps.add({
    ...skillGap,
    'createdAt': FieldValue.serverTimestamp(),
  });
}  
}
