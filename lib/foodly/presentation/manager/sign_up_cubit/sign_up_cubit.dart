import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/map_failure.dart'
    as fail;
import 'package:foodly_clean_arc/foodly/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUp() async {
    final signUpUsecase = SignUpUsecase();
    emit(SignUpLoading());
    await signUpUsecase.signUp().then((value) {
      value.fold(
          (failure) => emit(SignUpFailure(
                message: fail.mapFailureToMessage(failure),
              )), (loginEntity) async {
        emit(SignUpSuccess());
        // emit login page after successful sign up
      });
    });
  }
}
