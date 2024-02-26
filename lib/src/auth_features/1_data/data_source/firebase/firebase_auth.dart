import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_app_clone/src/auth_features/1_data/data_source/firebase/firebase.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseCloudService _cloudService = FirebaseCloudService();

// sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
// merge to avoid duplicating users
      _cloudService.mergeUsers(userCredential, email);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // create new user
  Future<UserCredential> createNewUser(String email, dynamic password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // store user data from current account after creating new account
      _cloudService.addUserToFireStore(userCredential, email);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//  sign out from account
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
