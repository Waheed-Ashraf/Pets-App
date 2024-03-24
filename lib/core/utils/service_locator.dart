import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pets_app/Core/utils/api_service.dart';
import 'package:pets_app/Features/Cats/data/CatsRepo/cats_repo.dart';
import 'package:pets_app/Features/Cats/data/CatsRepo/cats_repo_imp.dart';
import 'package:pets_app/Features/Cats/presentation/controller/CatsBreedsCubit/cats_breeds_cubit.dart';
import 'package:pets_app/Features/Cats/presentation/controller/SimilarCatsImagesCubit/similar_cats_images_cubit.dart';
import 'package:pets_app/Features/Dogs/data/DogsRepo/dogs_repo.dart';
import 'package:pets_app/Features/Dogs/data/DogsRepo/dogs_repo_imp.dart';
import 'package:pets_app/Features/Dogs/presentation/controller/DogsViewCubit/dogs_view_cubit.dart';
import 'package:pets_app/Features/Dogs/presentation/controller/similarDogsImageList/similar_dogs_images_cubit.dart';
import 'package:pets_app/Features/Explore/data/ExploreRepo/explore_repo.dart';
import 'package:pets_app/Features/Explore/data/ExploreRepo/explore_repo_imp.dart';
import 'package:pets_app/Features/Explore/presentation/controller/ExploreCubit/explore_cubit.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo.dart';
import 'package:pets_app/Features/Favorit/data/FavRepo/fav_repo_imp.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCubit/favorit_cubit.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  // cubit
  getIt.registerFactory<CatsBreedsCubit>(() => CatsBreedsCubit(getIt()));
  getIt.registerFactory<DogsViewCubit>(() => DogsViewCubit(getIt()));
  getIt.registerFactory<ExploreCubit>(() => ExploreCubit(getIt()));
  getIt.registerFactory<FavoritCubit>(() => FavoritCubit(getIt()));
  getIt.registerFactory<SimilarCatsImagesCubit>(
      () => SimilarCatsImagesCubit(getIt()));
  getIt.registerFactory<SimilarDogsImagesCubit>(
      () => SimilarDogsImagesCubit(getIt()));

  //Repo
  getIt.registerLazySingleton<CatsRepo>(() => CatsRepoImp(getIt()));
  getIt.registerLazySingleton<DogsRepo>(() => DogsRepoImp(getIt()));
  getIt.registerLazySingleton<ExploreRepo>(() => ExploreRepoImp(getIt()));
  getIt.registerLazySingleton<FavRepo>(() => FavRepoImp(getIt()));

  //webServices
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}
//  Dio createAndSetupDio() {
//     Dio dio = Dio();

//     dio
//       ..options.connectTimeout = (200 * 1000) as Duration?
//       ..options.receiveTimeout = (200 * 1000) as Duration?;

//     dio.interceptors.add(LogInterceptor(
//       responseBody: true,
//       error: true,
//       requestHeader: false,
//       responseHeader: false,
//       request: true,
//       requestBody: true,
//     ));

//     return dio;
//   }
