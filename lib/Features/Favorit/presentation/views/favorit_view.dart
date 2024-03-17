import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCubit/favorit_cubit.dart';
import 'package:pets_app/Features/Favorit/presentation/views/widgets/favorit_list.dart';

class FavoritView extends StatefulWidget {
  const FavoritView({super.key});

  @override
  State<FavoritView> createState() => _FavoritViewState();
}

class _FavoritViewState extends State<FavoritView> {
  @override
  void initState() {
    BlocProvider.of<FavoritCubit>(context).fetchFavoritList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FavoritList());
  }
}
