abstract class Failure {}

class LoginFailure extends Failure {
  final String loginFailureMessage;
  LoginFailure({required this.loginFailureMessage});
}

class SignUpFailure extends Failure {
  final String signUpFailureMessage;
  SignUpFailure({required this.signUpFailureMessage});
}

class GeneralFailure extends Failure {
  String? message = 'General Failure';
  GeneralFailure({this.message});
}
