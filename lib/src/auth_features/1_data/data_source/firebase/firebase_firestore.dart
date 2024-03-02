import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCloudService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
// STORE USERS INSIDE FIRESTORE DATABASE
  Future<void> saveUserIntoFireStore(
    UserCredential userCredential,
    String email,
  ) {
    final user = users.doc(userCredential.user!.uid).set(
      {'uid': userCredential.user!.uid, 'email': email},
    );
    return user;
  }

// MERGE USERS INSIDE FIRESTORE DATABASE TO AVOID DUPLICATING
  Future<void> mergeUsers(UserCredential userCredential, String email) =>
      users.doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
        SetOptions(merge: true),
      );

// Delete Users From FireStore Database
  Future<void> deleteUsers(UserCredential userCredential) =>
      users.doc(userCredential.user!.uid).delete();

// Display User by their name
  Future<void> displayUsers(UserCredential userCredential) =>
      users.doc(userCredential.user!.displayName).get();
}
