import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Core/utils/service_locator.dart';
import 'package:pets_app/Features/Cats/presentation/controller/CatsBreedsCubit/cats_breeds_cubit.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cats_view_body.dart';

class CatsView extends StatelessWidget {
  const CatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CatsBreedsCubit>()..getCatsBreedsList(),
      child: const Scaffold(
        body: CatsViewBody(),
      ),
    );
  }
}
