// ignore_for_file: cascade_invocations, flutter_style_todos

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whats_app_clone/src/home_features/0_data/repository/user_interface.dart';
import 'package:whats_app_clone/src/home_features/1_domain/model/users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc(this.usrImpl) : super(UsersInitial()) {
    on<GetUserEvent>(_getUserEvent);
    on<AddUsersEvent>(_addUsrEvent);
    on<UpdateUsersEvent>(_updateUserEvent);
    on<DeleteUsersEvent>(_deleteUserEvent);
  }
  final UserRepoImpl usrImpl;
//TOdo: READ -> get all users
  FutureOr<void> _getUserEvent(
    GetUserEvent event,
    Emitter<UsersState> emit,
  ) async {
    try {
      final user = await usrImpl.getUser(event.uid);
      if (user != null) {
        emit(GetAllUsers(user));
      }
    } catch (e) {
      emit(UserFetchingFailed(message: e.toString()));
    }
  }

//Todo: CREATE -> add new user
  Future<void> _addUsrEvent(
    AddUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(LoadingUserFetching());
    try {
      final users = <UserModel>[];
      users.addAll(state.users);
      users.insert(0, event.userModel);
      emit(CompleteUserFetching(userModel: event.userModel));
    } catch (e) {
      emit(UserFetchingFailed(message: e.toString()));
    }
  }

//Todo: UPDATE -> update user info
  FutureOr<void> _updateUserEvent(
    UpdateUsersEvent event,
    Emitter<UsersState> emit,
  ) {}

//Todo: DELETE -> delete user
  FutureOr<void> _deleteUserEvent(
    DeleteUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(LoadingUserFetching());

    try {
      await usrImpl.deleteUser(event.uid);
      emit(
        CompleteUserFetching(userModel: UserModel().copyWith(uid: event.uid)),
      );
      emit(DeleteFetchedUsers(uid: event.uid));
    } catch (e) {
      emit(UserFetchingFailed(message: e.toString()));
    }
  }
}
