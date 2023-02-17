import 'package:equatable/equatable.dart';

import '../../../domain/entities/auth_entity.dart';
abstract class LoginStates extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final AuthEntity userData;

  LoginSuccessState({required this.userData});

  @override
  List<Object> get props => [userData];
}

class LoginErrorState extends LoginStates {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

/*
class LoginDisActiveVisibilityState extends LoginStates {}

class LoginActiveVisibilityState extends LoginStates {}
*/
