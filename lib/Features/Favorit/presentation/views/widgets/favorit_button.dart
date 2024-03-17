import 'package:flutter/material.dart';

class FavoritButton extends StatelessWidget {
  final void Function()? onPressed;
  const FavoritButton({super.key, required this.onPressed});

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
            onPressed: onPressed,
            icon: const Icon(
              Icons.favorite,
              color: Colors.grey,
            )),
      ),
    );
  }
}
