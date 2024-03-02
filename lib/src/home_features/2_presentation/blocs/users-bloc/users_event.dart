part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class GetUserEvent extends UsersEvent {
  GetUserEvent(this.uid);

  final String uid;
}

class AddUsersEvent extends UsersEvent {
  AddUsersEvent(this.userModel);

  final UserModel userModel;
}

class UpdateUsersEvent extends UsersEvent {
  UpdateUsersEvent(this.userModel);

  final UserModel userModel;
}

class DeleteUsersEvent extends UsersEvent {
  DeleteUsersEvent(this.uid);
  final String uid;
}
