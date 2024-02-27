import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whats_app_clone/src/auth_features/1_data/data_source/firebase/firebase_auth.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final FirebaseAuthService _authService;
  SignUpCubit(this._authService) : super(SignUpInitial());

  Future<void> createNewUser(String email, String password) async {
    await _authService.createNewUser(email, password);
  }
}
