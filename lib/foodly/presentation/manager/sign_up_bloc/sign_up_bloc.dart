import 'package:bloc/bloc.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/map_failure.dart'
    as fail;
import 'package:foodly_clean_arc/foodly/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpcBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpcBloc() : super(SignUpInitial()) {
    Stream<String> mapEventToState(SignUpEvent event) async* {
      if (event is SignUpRequestedEvent) {
        yield event.email;
        yield event.password;
      }
    }

    on<SignUpEvent>((event, emit) async {
      final signUpUsecase = SignUpUsecase();
      emit(SignUpLoading());
      await signUpUsecase.signUp().then((value) {
        value.fold(
            (failure) => emit(SignUpFailure(
                  message: fail.mapFailureToMessage(failure),
                )), (signUpEntity) async {
          emit(SignUpSuccess());
        });
      });
    });
  }
}
