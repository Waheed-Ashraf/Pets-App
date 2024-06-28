import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Core/theme/app_theme.dart';
import 'package:pets_app/Core/utils/service_locator.dart';
import 'package:pets_app/Features/Cats/presentation/controller/SimilarCatsImagesCubit/similar_cats_images_cubit.dart';
import 'package:pets_app/Features/Dogs/presentation/controller/similarDogsImageList/similar_dogs_images_cubit.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCatCubit/favorit_cubit.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavDogCubit/favorit_dogs_cubit.dart';
import 'package:pets_app/Features/splash/presentation/View/splash_view.dart';
import 'package:pets_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FavoritCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<FavoritDogsCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SimilarCatsImagesCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SimilarDogsImagesCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: lightMood,
        home: const SplashView(),
      ),
    );
  }
}
