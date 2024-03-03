import 'package:flutter/material.dart';

import 'widgets/signing_view_body.dart';

class SigningView extends StatelessWidget {
  const SigningView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SigningViewBody(),
    );
  }
}
