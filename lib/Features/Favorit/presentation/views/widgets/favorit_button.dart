import 'package:flutter/material.dart';

class FavoritButton extends StatelessWidget {
  final void Function() onPressed;
  final Color color;
  const FavoritButton(
      {super.key, required this.onPressed, required this.color});

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
          icon: Icon(
            Icons.favorite,
            color: color,
          ),
        ),
      ),
    );
  }
}
