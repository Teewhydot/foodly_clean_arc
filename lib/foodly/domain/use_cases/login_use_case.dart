import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

class LoginUsecase {
  Future<Either<Failure, LoginEntity>> login() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return right(LoginEntity());
    });
  }
}
