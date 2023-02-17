import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/login_usecase.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;
  IconData visibility = Icons.visibility_off_outlined;

  /*void changeVisibility() {
    obscureText = !obscureText;
    visibility =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    obscureText
        ? emit(LoginDisActiveVisibilityState())
        : emit(LoginActiveVisibilityState());
  }*/

  void login({
    required String phone,
  }) async {
    emit(LoginLoadingState());
    LoginParameter parameter = LoginParameter(
      phone: phone,
    );
    var result = await loginUseCase(parameter);
    result.fold(
      (l) => emit(LoginErrorState(errorMessage: l.message)),
      (r) => emit(LoginSuccessState(userData: r)),
    );
  }
}
