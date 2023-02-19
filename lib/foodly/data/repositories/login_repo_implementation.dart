import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodly_clean_arc/foodly/data/remote/data_sources/login_data_source.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_failed_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/repositories/login_repo.dart';

class LoginRepoImplementation implements LoginRepo {
  @override
  Future<Either<LoginFailureEntity, LoginEntity>> logUserIn(
      String email, String password) async {
    try {
      final LoginDataSource loginDataSource = LoginDataSourceImplementation();
      final result = await loginDataSource.logUserInFirebase(email, password);
      return right(result);
    } catch (e) {
      debugPrint(e.toString());
      return left(LoginFailureEntity(failureMessage: e.toString()));
    }
  }
}
