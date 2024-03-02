import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignIn {
  final firebaseAuth = FirebaseAuth.instance;

// GOOGLE SIGN IN METHOD
  Future<UserCredential> signInWithGoogle() async {
    // ignore: unused_local_variable
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signInWithGoogle() as GoogleSignInAccount?;

    //auth details from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // create new credential for user;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await firebaseAuth.signInWithCredential(credential);
  }
}
