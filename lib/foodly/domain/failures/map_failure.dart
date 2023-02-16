import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

String mapFailureToMessage(Failure failures) {
  switch (failures.runtimeType) {
    case ServerFailure:
      return 'Server Failure';
    case InvalidDetailsFailure:
      return 'Invalid Details, Please try again';
    case InternetFailure:
      return 'Your internet connection is not working, Please try again';
    default:
      return 'Something went wrong';
  }
}
