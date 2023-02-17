import 'package:dartz/dartz.dart';
import 'package:foodly_clean_arc/foodly/data/custom_exceptions/custom_exceptions.dart';
import 'package:foodly_clean_arc/foodly/data/remote/data_sources/login_data_source.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/failures.dart';
import 'package:foodly_clean_arc/foodly/domain/repositories/login_repo.dart';

class LoginRepoImplementation implements LoginRepo {
  @override
  Future<Either<Failure, LoginEntity>> logUserIn(
      String email, String password) async {
    try {
      final LoginDataSource loginDataSource = LoginDataSourceImplementation();
      final result = await loginDataSource.logUserInFirebase(email, password);
      return right(result);
    } on InternetException catch (_) {
      return left(InternetFailure());
    } on InvalidDetailsException catch (_) {
      return left(InvalidDetailsFailure());
    } on UserNotFoundException catch (_) {
      return left(UserNotFoundFailure());
    } catch (e) {
      print(e);
      return left(GeneralFailure());
    }
  }
}
