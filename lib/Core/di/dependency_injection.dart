import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:markatty/Core/Networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await getIt.reset();

  // Dio and ApiService
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));


}
