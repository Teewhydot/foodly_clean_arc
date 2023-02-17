import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/data/repositories/login_repo_implementation.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';

class LoginUsecase {
  final LoginRepoImplementation loginRepo = LoginRepoImplementation();
  Future<Either<Failure, LoginEntity>> login(
      String email, String password) async {
    return loginRepo.logUserIn(email, password);
  }
}
