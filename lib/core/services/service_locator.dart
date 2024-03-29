import 'package:elwarsha/authentication/domain/usecase/confirm_verify_code.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:elwarsha/car_wash/presetation/controller/car_wash_cubit/wash_cubit.dart';
import 'package:elwarsha/layout/data/layout_data_source/layout_data_source.dart';
import 'package:elwarsha/layout/domain/base_repository/layout_base_repository.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_profile_data_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_slides_usecase.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:elwarsha/repair/presentation/controllers/repair_cubit/repair_cubit.dart';
import 'package:elwarsha/winch/data/data_source/winch_data_source.dart';
import 'package:elwarsha/winch/data/repository/winch_repository.dart';
import 'package:elwarsha/winch/domain/base_repository/base_winch_erpository.dart';
import 'package:elwarsha/winch/domain/usecase/winch_usecase.dart';
import 'package:elwarsha/winch/presentation/controller/winch_cubit/winch_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../authentication/data/data_source/auth_data_source.dart';
import '../../authentication/data/repository/auth_repository.dart';
import '../../authentication/domain/base_repository/base_auth_repository.dart';
import '../../authentication/domain/usecase/login_usecase.dart';
import '../../authentication/presentation/controller/login_cubit/login_cubit.dart';
import '../../car_wash/data/data_source/wash_data_source.dart';
import '../../car_wash/data/repository/wash_repository.dart';
import '../../car_wash/domain/base_repository/base_wash_repository.dart';
import '../../car_wash/domain/usecase/wash_usecase.dart';
import '../../layout/data/repository/layout_repository.dart';
import '../../repair/data/data_source/repair_data_source.dart';
import '../../repair/data/repository/repair_repository.dart';
import '../../repair/domain/base_repsitory/base_repair_repository.dart';
import '../../repair/domain/usecase/repair_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///Cubit
    sl.registerFactory(() => LoginCubit(sl(), sl(), sl()));
    sl.registerFactory(() => LayoutCubit(sl(),sl(),sl()));
    sl.registerFactory(() => WinchCubit(sl()));
    sl.registerFactory(() => WashCubit(sl()));
    sl.registerFactory(() => RepairCubit(sl()));

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
    sl.registerLazySingleton<GetProfileDataUseCase>(() => GetProfileDataUseCase(sl()));

    ///Layout_repository
    sl.registerLazySingleton<BaseLayoutRepository>(() => LayoutRepository(sl()));

    ///Layout_Data_source
    sl.registerLazySingleton<BaseLayoutDataSource>(() => LayoutDataSource());

    ///Winch_Use_Case
    sl.registerLazySingleton<WinchUseCase>(() => WinchUseCase(sl()));

    ///Winch_repository
    sl.registerLazySingleton<BaseWinchRepository>(() => WinchRepository(sl()));

    ///Winch_Data_source
    sl.registerLazySingleton<BaseWinchDataSource>(() => WinchDataSource());

    ///Wash_Use_Case
    sl.registerLazySingleton<WashUseCase>(() => WashUseCase(sl()));

    ///Wash_repository
    sl.registerLazySingleton<BaseWashRepository>(() => WashRepository(sl()));

    ///Wash_Data_source
    sl.registerLazySingleton<BaseWashDataSource>(() => WashDataSource());


    ///Repair_Use_Case
    sl.registerLazySingleton<RepairUseCase>(() => RepairUseCase(sl()));

    ///Repair_repository
    sl.registerLazySingleton<BaseRepairRepository>(() => RepairRepository(sl()));

    ///Repair_Data_source
    sl.registerLazySingleton<BaseRepairDataSource>(() => RepairDataSource());
  }
}
