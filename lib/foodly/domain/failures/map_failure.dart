import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case LoginFailure:
      return 'Kindly check your login details or your internet';
    default:
      return 'Error due to some reason';
  }
}
