import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/data/repositories/login_repo_implementation.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_failed_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';

class LoginUsecase {
  final LoginRepoImplementation loginRepo = LoginRepoImplementation();
  Future<Either<LoginFailureEntity, LoginEntity>> login(
      String email, String password) async {
    return loginRepo.logUserIn(email, password);
  }
}
