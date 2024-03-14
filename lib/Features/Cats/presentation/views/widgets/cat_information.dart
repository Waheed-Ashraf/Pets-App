import 'package:flutter/material.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/custom_info_widgets.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: Row(
            children: [
              Text(
                'Weight:',
                style: AppStyles.styleSemiBold18.copyWith(color: primaryColor),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                cat.weight!.imperial!,
                style: AppStyles.styleMedium18.copyWith(color: secondaryColor),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Kg',
                style: AppStyles.styleMedium18.copyWith(color: secondaryColor),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              'Origin:',
              style: AppStyles.styleSemiBold18.copyWith(color: primaryColor),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              cat.origin,
              style: AppStyles.styleMedium18.copyWith(color: secondaryColor),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'Life Span:',
              style: AppStyles.styleSemiBold18.copyWith(color: primaryColor),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              cat.lifeSpan,
              style: AppStyles.styleMedium18.copyWith(color: secondaryColor),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Description:',
          style: AppStyles.styleSemiBold18.copyWith(color: primaryColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          cat.description,
          style: AppStyles.styleMedium18.copyWith(color: secondaryColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Indoor',
                    percent: cat.indoor.toDouble(),
                    centerText: cat.indoor.toString(),
                  ),
                ),
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Lap',
                    percent: cat.lap.toDouble() / 10,
                    centerText: cat.lap.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Rare',
                    percent: cat.rare.toDouble() / 10,
                    centerText: cat.rare.toString(),
                  ),
                ),
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Rex',
                    percent: cat.rex.toDouble() / 10,
                    centerText: cat.rex.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Natural',
                    percent: cat.natural.toDouble() / 10,
                    centerText: cat.natural.toString(),
                  ),
                ),
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Short Legs',
                    percent: cat.shortLegs.toDouble() / 10,
                    centerText: cat.shortLegs.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Child Friendly',
                    percent: cat.childFriendly.toDouble() / 10,
                    centerText: cat.childFriendly.toString(),
                  ),
                ),
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Dog Friendly',
                    percent: cat.dogFriendly.toDouble() / 10,
                    centerText: cat.dogFriendly.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Grooming',
                    percent: cat.grooming.toDouble() / 10,
                    centerText: cat.grooming.toString(),
                  ),
                ),
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Adaptability',
                    percent: cat.adaptability.toDouble() / 10,
                    centerText: cat.adaptability.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Hairless',
                    percent: cat.hairless.toDouble() / 10,
                    centerText: cat.hairless.toString(),
                  ),
                ),
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Social Needs',
                    percent: cat.socialNeeds.toDouble() / 10,
                    centerText: cat.socialNeeds.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Shedding Level',
                    percent: cat.sheddingLevel.toDouble() / 10,
                    centerText: cat.sheddingLevel.toString(),
                  ),
                ),
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Stranger Friendly',
                    percent: cat.strangerFriendly.toDouble() / 10,
                    centerText: cat.strangerFriendly.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Vocalisation',
                    percent: cat.vocalisation.toDouble() / 10,
                    centerText: cat.vocalisation.toString(),
                  ),
                ),
                Expanded(
                  child: CustomInfoWidget(
                    cat: cat,
                    text: 'Experimental',
                    percent: cat.experimental.toDouble() / 10,
                    centerText: cat.experimental.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Read more on wikipedia:',
                  style:
                      AppStyles.styleSemiBold18.copyWith(color: primaryColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      launchURLBrowser() async {
                        var url = Uri.parse(cat.wikipediaUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                    },
                    child: Text(
                      cat.wikipediaUrl,
                      style: AppStyles.styleMedium18
                          .copyWith(color: secondaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
