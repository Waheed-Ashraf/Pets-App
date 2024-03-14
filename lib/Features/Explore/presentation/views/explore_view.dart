import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Core/utils/service_locator.dart';
import 'package:pets_app/Features/Explore/presentation/controller/ExploreCubit/explore_cubit.dart';
import 'package:pets_app/Features/Explore/presentation/views/widgets/explore_list.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExploreCubit>()..fetchExploreImagesList(),
      child: const Scaffold(body: ExploreList()),
    );
  }
}
