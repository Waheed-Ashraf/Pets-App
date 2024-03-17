import 'package:flutter/material.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/dogs_breeds_model.dart';
import 'package:pets_app/Features/Dogs/presentation/views/widgets/dogs_details_view_body.dart';

class DogsDetailsView extends StatelessWidget {
  const DogsDetailsView({super.key, required this.dog});

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DogsDetailsViewBody(
        dog: dog,
      ),
    );
  }
}
