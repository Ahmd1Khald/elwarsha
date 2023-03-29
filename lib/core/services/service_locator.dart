import 'package:elwarsha/authentication/domain/usecase/confirm_verify_code.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:elwarsha/layout/data/layout_data_source/layout_data_source.dart';
import 'package:elwarsha/layout/domain/base_repository/layout_base_repository.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_slides_usecase.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../authentication/data/data_source/auth_data_source.dart';
import '../../authentication/data/repository/auth_repository.dart';
import '../../authentication/domain/base_repository/base_auth_repository.dart';
import '../../authentication/domain/usecase/login_usecase.dart';
import '../../authentication/presentation/controller/login_cubit/login_cubit.dart';
import '../../layout/data/repository/layout_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///Cubit
    sl.registerFactory(() => LoginCubit(sl(), sl(), sl()));
    sl.registerFactory(() => LayoutCubit(sl(),sl()));

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

    ///Layout_User_Case
    sl.registerLazySingleton<GetSlidesUserCase>(() => GetSlidesUserCase(sl()));
    sl.registerLazySingleton<GetProductUseCase>(() => GetProductUseCase(sl()));

    ///Layout_repository
    sl.registerLazySingleton<BaseLayoutRepository>(() => LayoutRepository(sl()));

    ///Layout_Data_source
    sl.registerLazySingleton<BaseLayoutDataSource>(() => LayoutDataSource());
  }
}
