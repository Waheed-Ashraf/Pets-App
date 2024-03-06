import 'package:flutter/material.dart';
import 'package:pets_app/Core/widgets/custom_search_textfield.dart';

class DogsView extends StatelessWidget {
  const DogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: DogsViewBody()),
    );
  }
}

class DogsViewBody extends StatelessWidget {
  const DogsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
        ),
        CustomSearchTextField(
          onTap: () {},
        ),
      ],
    );
  }
}
