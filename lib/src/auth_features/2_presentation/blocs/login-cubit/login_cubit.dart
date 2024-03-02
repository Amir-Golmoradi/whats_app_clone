import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:whats_app_clone/src/auth_features/1_data/data_source/firebase/firebase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._firebaseAuthService) : super(LoginInitial());
  final FirebaseAuthService _firebaseAuthService;

  // SIGN IN USER STATE
  Future<void> loginNewUser(String email, String password) async {
    await _firebaseAuthService.loginWithEmailAndPassword(email, password);
  }

// sign out from current account
  Future<void> signOut() async {
    return _firebaseAuthService.signOut();
  }
}
