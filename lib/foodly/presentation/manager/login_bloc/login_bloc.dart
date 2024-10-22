import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/login_entities/login_failed_entity.dart';
import 'package:foodly_clean_arc/foodly/domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginInitial()) {
    final LoginUsecase loginUsecase = LoginUsecase();
    on<LoginRequestedEvent>((
      event,
      emit,
    ) async {
      emit(LoginLoadingState());

      await loginUsecase.login(event.email, event.password).then((value) {
        value.fold(
            (failure) => emit(LoginFailureState(
                  message: failure,
                )),
            (loginEntity) => emit(LoginSuccessState()));
      });
    });

    on<LoginFailedEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 4));
      emit(LoginInitial());
    });
  }
}
