import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCubit/favorit_cubit.dart';

class FavoritButton extends StatefulWidget {
  final String imageId;

  const FavoritButton({
    super.key,
    required this.imageId,
  });

  @override
  State<FavoritButton> createState() => _FavoritButtonState();
}

class _FavoritButtonState extends State<FavoritButton> {
  Color color = Colors.grey;

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
        icon: Icon(
          Icons.favorite,
          color:
              (favoritBreedsIds.contains(widget.imageId)) ? Colors.red : color,
        ),
        onPressed: () {
          if (favoritBreedsIds.contains(widget.imageId)) {
          } else {
            setState(() {
              color = Colors.red;
            });
            BlocProvider.of<FavoritCubit>(context)
                .addItemToFavoritList(widget.imageId);
          }
        },
      )),
    );
  }
}
