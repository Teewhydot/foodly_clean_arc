import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/register_entities/registration_failed_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/sign_up_entities/sign_up_success_entity.dart';

abstract class SignUpRepo {
  Future<Either<RegistrationFailedEntity, SignUpEntity>> registerUser(
      String email, String password);
}
