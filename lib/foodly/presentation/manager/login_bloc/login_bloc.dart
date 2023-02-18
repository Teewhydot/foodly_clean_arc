import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/map_failure.dart';
import 'package:foodly_clean_arc/foodly/domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Stream<String> mapEventToState(LoginEvent event) async* {
    if (event is LoginRequestedEvent) {
      yield event.email;
      yield event.password;
    }
  }

  LoginBloc() : super(LoginInitial()) {
    final LoginUsecase loginUsecase = LoginUsecase();
    on<LoginRequestedEvent>((
      event,
      emit,
    ) async {
      emit(LoginLoadingState());
      debugPrint('email: ${event.email}');
      debugPrint('password: ${event.password}');
      await loginUsecase.login(event.email, event.password).then((value) {
        value.fold(
            (failure) => emit(LoginFailureState(
                  message: mapFailureToMessage(failure),
                )),
            (loginEntity) => emit(LoginSuccessState()));
      });
    });

    on<LoginFailedEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(LoginInitial());
    });
  }
}
