import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/sign_up_entities/sign_up_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

class SignUpUsecase {
  Future<Either<Failure, SignUpEntity>> signUp() async {
    return Future.delayed(const Duration(seconds: 5), () {
      return left(LoginFailure(loginFailureMessage: 'kk'));
    });
  }
}
