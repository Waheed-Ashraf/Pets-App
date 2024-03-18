import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCubit/favorit_cubit.dart';

class FavoritButton extends StatefulWidget {
  final CatModel cat;

  const FavoritButton({
    super.key,
    required this.cat,
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
        child: (BlocProvider.of<FavoritCubit>(context)
                .favoritBreedsIds
                .contains(widget.cat.image!.id))
            ? IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: color,
                ),
                onPressed: () {
                  setState(() {
                    color = Colors.red;
                  });
                  // BlocProvider.of<FavoritCubit>(context)
                  //     .favoritBreedsIds
                  //     .remove(cat.image!.id);
                  // BlocProvider.of<FavoritCubit>(context)
                  //     .deletItemFromFavoritList(favItemId);
                })
            : IconButton(
                onPressed: () {
                  setState(() {
                    BlocProvider.of<FavoritCubit>(context)
                        .addItemToFavoritList(widget.cat.image!.id);
                  });
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.grey,
                )),
      ),
    );
  }
}
