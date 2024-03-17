import 'package:flutter/material.dart';

class FavoritButton extends StatelessWidget {
  const FavoritButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.4),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.grey,
            )),
      ),
    );
  }
}
