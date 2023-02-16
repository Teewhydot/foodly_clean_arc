import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';

abstract class LoginDataSource {
  Future<LoginEntity> logUserIn();
}

class LoginDataSourceImplementation implements LoginDataSource {
  @override
  Future<LoginEntity> logUserIn() {
    // TODO: implement logUserIn
    throw UnimplementedError();
  }
}
