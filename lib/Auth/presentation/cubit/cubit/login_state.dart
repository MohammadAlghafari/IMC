part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  UserModel? userModel;
  LoginLoadedState(this.userModel);
}

class LoginErrorState extends LoginState {
  String errorMessage;
  LoginErrorState(this.errorMessage);
}
