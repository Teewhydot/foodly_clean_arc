import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequestedEvent>((event, emit) async {
      emit(LoginLoading());
      //wait for 3 secs then emit success
      await Future.delayed(const Duration(seconds: 3), () {
        emit(const LoginSuccess(message: "Login Success"));
      });
    });
  }
}
