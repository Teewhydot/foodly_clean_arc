part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailureState extends LoginState {
  final LoginFailureEntity failureMessage;

  const LoginFailureState({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];
}
