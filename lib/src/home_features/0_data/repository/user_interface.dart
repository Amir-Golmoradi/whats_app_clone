import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whats_app_clone/src/home_features/1_domain/model/users.dart';
import 'package:whats_app_clone/src/home_features/1_domain/repository/user_repository.dart';

class UserRepoImpl implements UserRepository {
  final firestore = FirebaseFirestore.instance;
  @override
  Future<void> addUser(UserModel userModel) async {
    final docRef = firestore.collection('users').doc(userModel.uid);
    await docRef.set(userModel.toMap());
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    final docRef = firestore.collection('users').doc(userModel.uid);
    await docRef.set(userModel.toMap());
  }

  @override
  Future<void> deleteUser(String uid) async {
    final docRef = firestore.collection('users').doc(uid);
    await docRef.delete();
  }

  @override
  Future<UserModel?> getUser(String uid) async {
    final docRef = firestore.collection('users').doc(uid);
    final docSnapShot = await docRef.get();

    if (docSnapShot.exists) {
      return UserModel.fromMap(docSnapShot.data()!);
    } else {
      return null;
    }
  }
}
