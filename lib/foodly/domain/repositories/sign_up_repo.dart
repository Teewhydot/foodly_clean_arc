import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/sign_up_entities/sign_up_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

abstract class SignUpRepo {
  Future<Either<Failure, SignUpEntity>> registerUser(
      String email, String password);
}
