//import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  // getIt.registerSingleton<MealsModel>(getIt());

  // cubit
  // getIt.registerFactory<FeaturedMealsCubit>(() => FeaturedMealsCubit(getIt()));
  // getIt.registerFactory<EgyptionFoodCubit>(() => EgyptionFoodCubit(getIt()));
  // getIt.registerFactory<MealDetailsCubit>(() => MealDetailsCubit(getIt()));
  // getIt.registerFactory<CountriesNameCubit>(() => CountriesNameCubit(getIt()));
  // getIt.registerFactory<FilterCubit>(() => FilterCubit(getIt()));
  // getIt.registerFactory<RandomMealCubit>(() => RandomMealCubit(getIt()));

  //Repo
  // getIt.registerLazySingleton<Repo>(() => RepoImp(getIt()));
  // getIt.registerLazySingleton<SearchRepo>(() => SearchRepoImp(getIt()));

  //webServices
  // getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}
