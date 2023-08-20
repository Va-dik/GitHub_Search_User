import 'package:gihub_search_user/models/user_model.dart';

abstract class UserState {}

class InitialUserState extends UserState {}

class LoadingUserState extends UserState {}

class LoadedUserState extends UserState {
  final User user;

  LoadedUserState({required this.user});
}

class ErrorUserState extends UserState {
  final String errorMessage;

  ErrorUserState({required this.errorMessage});
}
