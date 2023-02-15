import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

String mapFailureToMessage(Failure failures) {
  switch (failures.runtimeType) {
    case ServerFailure:
      return 'Server Failure';
    case CacheFailure:
      return 'Cache Failure';
    case InternetFailure:
      return 'General Failure';
    default:
      return 'Nothing went wrong';
  }
}
