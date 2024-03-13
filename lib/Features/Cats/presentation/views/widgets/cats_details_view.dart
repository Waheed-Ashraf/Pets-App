import 'package:flutter/material.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';

class CatsDetailsView extends StatelessWidget {
  const CatsDetailsView({super.key, required this.cat});

  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Column(
          children: [
            Text(
              {cat.countryCodes}.toString(),
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
