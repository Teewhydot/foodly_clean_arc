import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/map_failure.dart'
    as fail;
import 'package:foodly_clean_arc/foodly/domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final LoginUsecase loginUsecase = LoginUsecase();
    on<LoginRequestedEvent>((event, emit) async {
      emit(LoginLoading());
      await loginUsecase.login().then((value) {
        value.fold(
            (failure) => emit(LoginFailure(
                  message: fail.mapFailureToMessage(failure),
                )),
            (loginEntity) => emit(LoginSuccess()));
      });
    });
  }
}
