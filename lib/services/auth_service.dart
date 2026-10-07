import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> register({
    required String email,
    required String password,
    required String name,
    required String country,
    String? city,
    String? bio,
    String? careerGoal,
  }) async {
    // 1. Créer le compte dans Firebase Authentication
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;

    if (user == null) {
      throw Exception('La création du compte a échoué.');
    }

    // 2. Créer le profil de l'utilisateur dans Firestore
    await _db.collection('users').doc(user.uid).set({
      'name': name,
      'email': email,
      'country': country,
      'city': city,
      'photoUrl': null,
      'bio': bio,
      'careerGoal': careerGoal,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return credential;
  }

  Future<void> signOut() => _auth.signOut();
}