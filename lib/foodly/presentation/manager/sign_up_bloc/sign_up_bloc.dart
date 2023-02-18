import 'package:bloc/bloc.dart';
import 'package:foodly_clean_arc/foodly/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpcBloc extends Bloc<SignUpEvent, SignUpState> {
  Stream<String> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpRequestedEvent) {
      yield event.email;
      yield event.password;
    }
  }

  SignUpcBloc() : super(SignUpInitial()) {
    on<SignUpRequestedEvent>((event, emit) async {
      final signUpUsecase = SignUpUsecase();
      emit(SignUpLoading());
      await signUpUsecase.signUp().then((value) {
        value.fold(
            (failure) => emit(SignUpFailure(
                  message: 'k',
                )), (signUpEntity) async {
          emit(SignUpSuccess());
        });
      });
    });

    on<SignUpFailedEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(SignUpInitial());
    });
  }
}
