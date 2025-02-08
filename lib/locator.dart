import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_style/barber%20shop/repository/customaize_repository.dart';
import 'package:shop_style/barber%20shop/statemanagment/customaize_controller.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register Dio instance
  locator.registerSingleton<Dio>(Dio());

  locator.registerSingleton<ApiClientV3>(
    ApiClientV3(),
  );

  locator.registerSingleton<ApiClientV3>(
    ApiClientV3(
      headerType: AppHttpHeadersEnum.file,
      receiveTimeout: const Duration(
        seconds: 20,
      ),
    ),
    instanceName: "ApiClientV3File",
  );

  locator.registerSingleton<ApiClientV3>(
      ApiClientV3(
        headerType: AppHttpHeadersEnum.otp,
      ),
      instanceName: "ApiClientV3Otp");

  //controllers
  locator.registerLazySingleton<GlobalController>(() => GlobalController(),);
  locator.registerLazySingleton<BarberShopProvider>(() => BarberShopProvider(),);

  //repository
  locator.registerLazySingleton<IBarberRepository>(() => BarberRepository(),);
}
