import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/sign_up_entities/sign_up_success_entity.dart';

abstract class RegisterDataSource {
  Future<SignUpEntity> registerUser(String email, String password);
}

// implement firebase login functionality
class RegisterDataSourceImplementation implements RegisterDataSource {
  @override
  Future<SignUpEntity> registerUser(String email, String password) async {
    final auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    return SignUpEntity();
  }
}
