import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/custom_info_widgets.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cat.name,
              style: AppStyles.styleSemiBold24.copyWith(color: primaryColor),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 25,
                ))
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CustomInfoWidget(
                cat: cat,
                text: 'Indoor',
                percent: cat.indoor.toDouble(),
                centerText: cat.indoor.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Lap',
                percent: cat.lap.toDouble() / 5,
                centerText: cat.lap.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Rare',
                percent: cat.rare.toDouble() / 5,
                centerText: cat.rare.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Rex',
                percent: cat.rex.toDouble() / 5,
                centerText: cat.rex.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Natural',
                percent: cat.natural.toDouble() / 5,
                centerText: cat.natural.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Short Legs',
                percent: cat.shortLegs.toDouble() / 5,
                centerText: cat.shortLegs.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Child Friendly',
                percent: cat.childFriendly.toDouble() / 5,
                centerText: cat.childFriendly.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Dog Friendly',
                percent: cat.dogFriendly.toDouble() / 5,
                centerText: cat.dogFriendly.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Grooming',
                percent: cat.grooming.toDouble() / 5,
                centerText: cat.grooming.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Adaptability',
                percent: cat.adaptability.toDouble() / 5,
                centerText: cat.adaptability.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Hairless',
                percent: cat.hairless.toDouble() / 5,
                centerText: cat.hairless.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Social Needs',
                percent: cat.socialNeeds.toDouble() / 5,
                centerText: cat.socialNeeds.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Shedding Level',
                percent: cat.sheddingLevel.toDouble() / 5,
                centerText: cat.sheddingLevel.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Stranger Friendly',
                percent: cat.strangerFriendly.toDouble() / 5,
                centerText: cat.strangerFriendly.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Vocalisation',
                percent: cat.vocalisation.toDouble() / 5,
                centerText: cat.vocalisation.toString(),
              ),
              CustomInfoWidget(
                cat: cat,
                text: 'Experimental',
                percent: cat.experimental.toDouble() / 5,
                centerText: cat.experimental.toString(),
              ),
            ],
          ),
        ),
        const Divider(
          color: primaryColor, // You can set the color of the divider
          thickness: 2, // You can set the thickness of the divider
          height: 35, // You can set the height of the divider
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
    );
  }
}
