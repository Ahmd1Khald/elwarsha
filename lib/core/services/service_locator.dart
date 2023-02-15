
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///Cubit
    /*sl.registerFactory(()=>LoginCubit(sl()));
    sl.registerFactory(()=>RegisterCubit(sl()));*/

    ///Auth_Use_Case
   /* sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));*/

    ///Auth_repository
    // sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    ///Auth_Data_source
    // sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource());
  }
}
