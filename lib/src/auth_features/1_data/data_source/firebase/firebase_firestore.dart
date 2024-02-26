import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCloudService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
// add user into database
  Future<void> addUserToFireStore(UserCredential userCredential, String email) =>
      users.doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

// merge to avoid duplicating users
  Future<void> mergeUsers(UserCredential userCredential, String email) =>
      users.doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
        SetOptions(merge: true),
      );
}
