import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/AllFavoritCubit/all_favorit_cubit.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCatCubit/favorit_cubit.dart';
import 'package:pets_app/Features/Favorit/presentation/views/widgets/favorit_list.dart';

class FavoritView extends StatefulWidget {
  const FavoritView({super.key});

  @override
  State<FavoritView> createState() => _FavoritViewState();
}

class _FavoritViewState extends State<FavoritView> {
  @override
  void initState() {
    BlocProvider.of<FavoritCubit>(context).fetchCatsFavoritList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllFavoritCubit()..checkIfFavoritListEmpty(),
      child: Scaffold(body: BlocBuilder<AllFavoritCubit, AllFavoritState>(
        builder: (context, state) {
          if (state is AllFavoritEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/search.json',
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'There is no Favourite pictures, Try adding some',
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold16.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ],
              ),
            );
          } else {
            return const Column(
              children: [
                FavoritList(),
                // FavoritDogsList(),
              ],
            );
          }
        },
      )),
    );
  }
}
