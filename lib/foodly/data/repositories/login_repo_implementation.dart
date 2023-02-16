import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';
import 'package:foodly_clean_arc/foodly/domain/repositories/login_repo.dart';

class LoginRepoImplementation implements LoginRepo {
  @override
  Future<Either<Failure, LoginEntity>> logUserIn(
      String email, String password) {
    throw UnimplementedError();
  }
}
