import 'package:firebase_auth/firebase_auth.dart';

class AuthStateProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user => _firebaseAuth.authStateChanges();
}
