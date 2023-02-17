import 'package:dartz/dartz.dart';
import '../../../core/exceptions/failure.dart';
import '../entities/auth_entity.dart';
import '../usecase/login_usecase.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure,AuthEntity>> login(LoginParameter parameter);
}
