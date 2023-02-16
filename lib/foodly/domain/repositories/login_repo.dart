import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginEntity>> logUserIn(String email, String password);
}
