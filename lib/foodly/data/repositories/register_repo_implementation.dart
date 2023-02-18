import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/data/custom_exceptions/custom_exceptions.dart';
import 'package:foodly_clean_arc/foodly/data/remote/data_sources/register_data_source.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/sign_up_entities/sign_up_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';
import 'package:foodly_clean_arc/foodly/domain/repositories/sign_up_repo.dart';

class RegisterRepoImplementation implements SignUpRepo {
  @override
  Future<Either<Failure, SignUpEntity>> registerUser(
      String email, String password) async {
    final RegisterDataSource registerDataSource =
        RegisterDataSourceImplementation();
    try {
      final result = await registerDataSource.registerUser(email, password);
      return right(result);
    } on SignUpException catch (e) {
      return left(SignUpFailure(signUpFailureMessage: e.toString()));
    } catch (_) {
      return left(GeneralFailure());
    }
  }
}
