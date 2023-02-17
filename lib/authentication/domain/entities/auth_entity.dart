import 'package:equatable/equatable.dart';
import 'user_data.dart';

class AuthEntity extends Equatable {
  //final bool status;
  final String accessToken;
  final UserData data;

  const AuthEntity({
    //required this.status,
    required this.data,
    required this.accessToken,
  });

  @override
  List<Object> get props => [accessToken, data];
}
