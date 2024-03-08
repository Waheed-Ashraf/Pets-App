import 'package:flutter/material.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cats_view_body.dart';

class CatsView extends StatelessWidget {
  const CatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CatsViewBody(),
    );
  }
}
