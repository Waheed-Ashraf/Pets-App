import 'package:flutter/material.dart';
import 'package:pets_app/Core/widgets/custom_search_textfield.dart';
import 'package:pets_app/Features/Dogs/presentation/views/widgets/dogs_list.dart';

class DogsViewBody extends StatelessWidget {
  const DogsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSearchTextField(
            onTap: () {},
          ),
          DogsList(),
        ],
      ),
    );
  }
}
