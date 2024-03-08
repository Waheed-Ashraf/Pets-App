import 'package:flutter/material.dart';
import 'package:pets_app/Features/Dogs/presentation/views/widgets/dogs_view_body.dart';

class DogsView extends StatelessWidget {
  const DogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DogsViewBody(),
    );
  }
}
