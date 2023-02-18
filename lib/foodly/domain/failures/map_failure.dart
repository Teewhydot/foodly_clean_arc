import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case GeneralFailure:
      return 'Something went terribly wrong';
    case LoginFailure:
      return 'Login failed ';
    default:
      return 'Error due to some reason';
  }
}
