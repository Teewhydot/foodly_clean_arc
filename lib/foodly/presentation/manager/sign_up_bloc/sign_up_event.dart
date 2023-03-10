part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpRequestedEvent extends SignUpEvent {
  final String email;
  final String password;
  SignUpRequestedEvent({required this.email, required this.password});
}

class SignUpFailedEvent extends SignUpEvent {}
