import 'package:bloc/bloc.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/register_entities/registration_failed_entity.dart';
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

  SignUpcBloc() : super(SignUpInitialState()) {
    on<SignUpRequestedEvent>((event, emit) async {
      final signUpUsecase = SignUpUsecase();
      emit(SignUpLoadingState());
      await signUpUsecase.signUp(event.email, event.password).then((value) {
        value.fold(
            (failure) => emit(SignUpFailureState(
                  message: failure,
                )), (signUpEntity) async {
          emit(SignUpSuccessState());
        });
      });
    });

    on<SignUpFailedEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(SignUpInitialState());
    });
  }
}
