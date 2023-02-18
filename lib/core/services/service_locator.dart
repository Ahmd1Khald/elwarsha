import 'package:elwarsha/authentication/domain/usecase/confirm_verify_code.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../authentication/data/data_source/auth_data_source.dart';
import '../../authentication/data/repository/auth_repository.dart';
import '../../authentication/domain/base_repository/base_auth_repository.dart';
import '../../authentication/domain/usecase/login_usecase.dart';
import '../../authentication/presentation/controller/login_cubit/login_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///Cubit
    sl.registerFactory(() => LoginCubit(sl(), sl(), sl()));

    ///Auth_Use_Case
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<SendVerifyCodeUseCase>(
        () => SendVerifyCodeUseCase(sl()));
    sl.registerLazySingleton<ConfirmVerifyCodeUseCase>(
        () => ConfirmVerifyCodeUseCase(sl()));

    ///Auth_repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    ///Auth_Data_source
    sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource());
  }
}
