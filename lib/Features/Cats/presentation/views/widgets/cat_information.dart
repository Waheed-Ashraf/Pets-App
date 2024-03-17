import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cat_characteristics_list.dart';
import 'package:pets_app/Features/Favorit/data/Models/favorit_models.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCubit/favorit_cubit.dart';
import 'package:pets_app/Features/Favorit/presentation/views/widgets/favorit_button.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';
import 'package:pets_app/core/widgets/custom_button.dart';

class CatInformation extends StatelessWidget {
  const CatInformation({
    super.key,
    required this.cat,
  });

  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cat.name,
                style: AppStyles.styleSemiBold24.copyWith(color: primaryColor),
              ),
              BlocBuilder<FavoritCubit, FavoritState>(
                builder: (context, state) {
                  return (BlocProvider.of<FavoritCubit>(context)
                          .favoritBreedsIds
                          .contains(cat.image!.id))
                      ? FavoritButton(
                          color: Colors.red,
                          onPressed: () {
                            BlocProvider.of<FavoritCubit>(context)
                                .favoritBreedsIds
                                .remove(cat.image!.id);
                          })
                      : FavoritButton(
                          color: Colors.grey,
                          onPressed: () {
                            BlocProvider.of<FavoritCubit>(context)
                                .addItemToFavoritList(cat.image!.id);
                          });
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 8),
                  child: Table(
                    border: TableBorder.all(
                        color: primaryColor,
                        width: 1.5,
                        borderRadius: BorderRadius.circular(10)),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Weight',
                                  style: AppStyles.styleSemiBold16
                                      .copyWith(color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '${cat.weight!.imperial!} Kg',
                                  style: AppStyles.styleMedium16
                                      .copyWith(color: secondaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Origin',
                                  style: AppStyles.styleSemiBold16
                                      .copyWith(color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  cat.origin,
                                  style: AppStyles.styleMedium16
                                      .copyWith(color: secondaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Life Span',
                                  style: AppStyles.styleSemiBold16
                                      .copyWith(color: primaryColor),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  cat.lifeSpan,
                                  style: AppStyles.styleMedium16
                                      .copyWith(color: secondaryColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Description:',
                  style:
                      AppStyles.styleSemiBold16.copyWith(color: primaryColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  cat.description,
                  style:
                      AppStyles.styleMedium16.copyWith(color: secondaryColor),
                ),
                const Divider(
                  color: primaryColor, // You can set the color of the divider
                  thickness: 2, // You can set the thickness of the divider
                  height: 35, // You can set the height of the divider
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Characteristics:',
                  style:
                      AppStyles.styleSemiBold16.copyWith(color: primaryColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 90,
                child: CatCharacteristicsList(cat: cat),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                  height: 35,
                ),
                Text(
                  'Read more on wikipedia:',
                  style:
                      AppStyles.styleSemiBold18.copyWith(color: primaryColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 90, right: 90),
                    child: CustomButton(
                      text: 'Read more...',
                      onPressed: () {},
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
