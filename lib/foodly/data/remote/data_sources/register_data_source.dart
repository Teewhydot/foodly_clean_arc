import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodly_clean_arc/foodly/data/custom_exceptions/custom_exceptions.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/sign_up_entities/sign_up_success_entity.dart';

abstract class RegisterDataSource {
  Future<SignUpEntity> registerUser(String email, String password);
}

// implement firebase login functionality
class RegisterDataSourceImplementation implements RegisterDataSource {
  @override
  Future<SignUpEntity> registerUser(String email, String password) async {
    final auth = FirebaseAuth.instance;
    final response = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (response.user != null) {
      return SignUpEntity();
    } else {
      throw SignUpException();
    }
  }
}
