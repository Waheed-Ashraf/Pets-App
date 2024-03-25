import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pets_app/Core/widgets/grediant_button.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cat_characteristics_list.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/similar_cats_Images_list.dart';
import 'package:pets_app/Features/Favorit/presentation/views/widgets/cats_favorit_button.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';
import 'package:pets_app/core/utils/functions/launch_url.dart';

class CatInformation extends StatelessWidget {
  const CatInformation({
    super.key,
    required this.cat,
  });
  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    // print(favoritBreedsIds);
    // print(BlocProvider.of<FavoritCubit>(context).favoritItemsIds);

    return FadeInUp(
      duration: const Duration(seconds: 1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cat.name,
                  style:
                      AppStyles.styleSemiBold24.copyWith(color: primaryColor),
                ),
                CatsFavoritButton(imageId: cat.image!.id),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                const SimilarImagesList(),
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                  height: 35,
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
                height: 112,
                child: CatCharacteristicsList(cat: cat),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          GradientButton(
            text: 'Read More',
            onPressed: () {
              launchCustomUrl(context: context, url: cat.wikipediaUrl);
            },
          ),
        ],
      ),
    );
  }
}
