import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pets_app/Core/utils/api_service.dart';
import 'package:pets_app/Features/Cats/data/CatsRepo/cats_repo.dart';
import 'package:pets_app/Features/Cats/data/CatsRepo/cats_repo_imp.dart';
import 'package:pets_app/Features/Cats/presentation/controller/CatsBreedsCubit/cats_breeds_cubit.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  // cubit
  getIt.registerFactory<CatsBreedsCubit>(() => CatsBreedsCubit(getIt()));

  //Repo
  getIt.registerLazySingleton<CatsRepo>(() => CatsRepoImp(getIt()));

  //webServices
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = (200 * 1000) as Duration?
    ..options.receiveTimeout = (200 * 1000) as Duration?;

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
