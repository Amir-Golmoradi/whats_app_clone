part of 'users_bloc.dart';

@immutable
abstract class UsersState {
  const UsersState({this.users = const []});
  final List<UserModel> users;
}

final class UsersInitial extends UsersState {}

class GetAllUsers extends UsersState {
  const GetAllUsers(this.userModel);
  final UserModel userModel;
}

class LoadingUserFetching extends UsersState {}

class CompleteUserFetching extends UsersState {
  const CompleteUserFetching({required this.userModel});

  final UserModel userModel;
}

class DeleteFetchedUsers extends UsersState {
  const DeleteFetchedUsers({required this.uid});
  final String uid;
}

class UserFetchingFailed extends UsersState {
  const UserFetchingFailed({required this.message});

  final String message;
}
