import 'package:whats_app_clone/src/home_features/1_domain/model/users.dart';

abstract class UserRepository {
  // get all users
  Future<UserModel?> getUser(String uid);
  // add users
  Future<void> addUser(UserModel userModel);
  // update users
  Future<void> updateUser(UserModel user);
  // delete users
  Future<void> deleteUser(String uid);
}
