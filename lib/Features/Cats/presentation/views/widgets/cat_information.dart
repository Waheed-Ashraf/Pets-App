import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cat_characteristics_list.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cat.name,
                style: AppStyles.styleSemiBold24.copyWith(color: primaryColor),
              ),
              FavoritButton(onPressed: () {
                BlocProvider.of<FavoritCubit>(context)
                    .addItemToFavoritList(cat.image!.id);
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(
                      color: primaryColor,
                      width: 1.5,
                      borderRadius: BorderRadius.circular(10)),
                  children: [
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TableCell(
                            child: Center(
                              child: Text(
                                'Weight',
                                style: AppStyles.styleSemiBold16
                                    .copyWith(color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TableCell(
                            child: Center(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TableCell(
                            child: Center(
                              child: Text(
                                'Origin',
                                style: AppStyles.styleSemiBold16
                                    .copyWith(color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TableCell(
                            child: Center(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TableCell(
                            child: Center(
                              child: Text(
                                'Life Span',
                                style: AppStyles.styleSemiBold16
                                    .copyWith(color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TableCell(
                            child: Center(
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
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Description:',
            style: AppStyles.styleSemiBold16.copyWith(color: primaryColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            cat.description,
            style: AppStyles.styleMedium16.copyWith(color: secondaryColor),
          ),
          const Divider(
            color: primaryColor, // You can set the color of the divider
            thickness: 2, // You can set the thickness of the divider
            height: 35, // You can set the height of the divider
          ),
          Text(
            'Characteristics:',
            style: AppStyles.styleSemiBold16.copyWith(color: primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 90,
            child: CatCharacteristicsList(cat: cat),
          ),
          const Divider(
            color: primaryColor,
            thickness: 2,
            height: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Read more on wikipedia:',
                style: AppStyles.styleSemiBold18.copyWith(color: primaryColor),
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
        ],
      ),
    );
  }
}
