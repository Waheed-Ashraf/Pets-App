import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Core/utils/service_locator.dart';
import 'package:pets_app/Features/Dogs/presentation/controller/DogsViewCubit/dogs_view_cubit.dart';
import 'package:pets_app/Features/Dogs/presentation/views/widgets/dogs_view_body.dart';

class DogsView extends StatelessWidget {
  const DogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<DogsViewCubit>()..getDogsBreedsList(),
        child: const Scaffold(
          body: DogsViewBody(),
        ));
  }
}
