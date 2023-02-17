import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodly_clean_arc/foodly/data/custom_exceptions/custom_exceptions.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_success_entity.dart';

abstract class LoginDataSource {
  Future<LoginEntity> logUserInFirebase(String email, String password);
}

// implement firebase login functionality
class LoginDataSourceImplementation implements LoginDataSource {
  @override
  Future<LoginEntity> logUserInFirebase(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      final response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user != null) {
        return LoginEntity();
      } else {
        throw InvalidDetailsException();
      }
    } on Exception catch (e) {
      print(e.toString());
      throw UserNotFoundException();
    }
  }
}
