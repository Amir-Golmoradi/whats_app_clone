import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app_clone/src/auth_features/1_data/data_source/firebase/firebase.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseCloudService _cloudService = FirebaseCloudService();

// LOGIN WITH EMAIL AND PASSWORD METHOD
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _cloudService.mergeUsers(userCredential, email);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// CREATE A NEW USER WITH EMAIL AND PASSWORD METHOD
  Future<UserCredential> createNewUser(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _cloudService.saveUserIntoFireStore(userCredential, email);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// SIGN OUT METHOD
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
