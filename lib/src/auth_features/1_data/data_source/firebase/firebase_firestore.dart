import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCloudService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
// STORE USERS INSIDE FIRESTORE DATABASE
  Future<void> saveUserIntoFireStore(
          UserCredential userCredential, String email,) =>
      users.doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );

// MERGE USERS INSIDE FIRESTORE DATABASE TO AVOID DUPLICATING
  Future<void> mergeUsers(UserCredential userCredential, String email) =>
      users.doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
        SetOptions(merge: true),
      );
}
