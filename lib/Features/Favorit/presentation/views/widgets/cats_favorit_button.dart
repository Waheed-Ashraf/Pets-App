import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCatCubit/favorit_cubit.dart';

class CatsFavoritButton extends StatefulWidget {
  final String imageId;

  const CatsFavoritButton({
    super.key,
    required this.imageId,
  });

  @override
  State<CatsFavoritButton> createState() => _CatsFavoritButtonState();
}

class _CatsFavoritButtonState extends State<CatsFavoritButton> {
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
          if (favoritCatsIds.contains(widget.imageId)) {
          } else {
            setState(() {
              color = Colors.red;
            });
            BlocProvider.of<FavoritCubit>(context)
                .addCatToFavoritList(widget.imageId);
          }
        },
      )),
    );
  }
}
