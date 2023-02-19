import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_failed_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';

abstract class LoginRepo {
  Future<Either<LoginFailureEntity, LoginEntity>> logUserIn(
      String email, String password);
}
