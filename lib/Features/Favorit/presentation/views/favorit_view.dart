import 'package:flutter/material.dart';
import 'package:pets_app/Features/Favorit/presentation/views/widgets/favorit_list.dart';

class FavoritView extends StatelessWidget {
  const FavoritView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FavoritList());
  }
}
