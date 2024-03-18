import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCubit/favorit_cubit.dart';

class FavoritButton extends StatefulWidget {
  final CatModel cat;
  Color? color;

  FavoritButton({
    super.key,
    required this.cat,
  });

  @override
  State<FavoritButton> createState() => _FavoritButtonState();
}

class _FavoritButtonState extends State<FavoritButton> {
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
          color: (favoritBreedsIds.contains(widget.cat.image!.id))
              ? Colors.red
              : widget.color,
        ),
        onPressed: () {
          if (favoritBreedsIds.contains(widget.cat.image!.id)) {
          } else {
            setState(() {
              widget.color = Colors.red;
            });
            BlocProvider.of<FavoritCubit>(context)
                .addItemToFavoritList(widget.cat.image!.id);
          }
        },
      )

          // ? IconButton(
          //     icon: const Icon(
          //       Icons.favorite,
          //       color: Colors.red,
          //     ),
          //     onPressed: () {
          //       // BlocProvider.of<FavoritCubit>(context)
          //       //     .favoritBreedsIds
          //       //     .remove(cat.image!.id);
          //       // BlocProvider.of<FavoritCubit>(context)
          //       //     .deletItemFromFavoritList(favItemId);
          //     })
          // : IconButton(
          //     onPressed: () {
          //       setState(() {
          //         widget.color = Colors.red;
          //       });
          //       BlocProvider.of<FavoritCubit>(context)
          //           .addItemToFavoritList(widget.cat.image!.id);
          //     },
          //     icon: Icon(
          //       Icons.favorite,
          //       color: widget.color,
          //     )),
          ),
    );
  }
}
