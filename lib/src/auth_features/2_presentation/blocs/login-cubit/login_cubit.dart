import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:whats_app_clone/src/auth_features/1_data/data_source/firebase/firebase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthService _firebaseAuthService;
  LoginCubit(this._firebaseAuthService) : super(LoginInitial());

  // sign in in current account

  Future<void> signIn(String email, String password) async {
    await _firebaseAuthService.signInWithEmailAndPassword(
      email,
      password,
    );
  }

// sign out from current account
  Future<void> signOut() async {
    return await _firebaseAuthService.signOut();
  }
}
