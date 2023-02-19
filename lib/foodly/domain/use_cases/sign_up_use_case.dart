import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/data/repositories/register_repo_implementation.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/register_entities/registration_failed_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/sign_up_entities/sign_up_success_entity.dart';

class SignUpUsecase {
  final RegisterRepoImplementation registerRepo = RegisterRepoImplementation();
  Future<Either<RegistrationFailedEntity, SignUpEntity>> signUp(
      String email, String password) async {
    return registerRepo.registerUser(email, password);
  }
}
