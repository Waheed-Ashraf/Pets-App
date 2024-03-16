import 'package:flutter/material.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/custom_info_widgets.dart';

class CatCharacteristicsList extends StatelessWidget {
  const CatCharacteristicsList({
    super.key,
    required this.cat,
  });

  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        cat.indoor != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Indoor',
                percent: cat.indoor.toDouble() / 5,
                centerText: cat.indoor.toString(),
              )
            : Container(),
        cat.lap != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Lap',
                percent: cat.lap.toDouble() / 5,
                centerText: cat.lap.toString(),
              )
            : Container(),
        cat.rare != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Rare',
                percent: cat.rare.toDouble() / 5,
                centerText: cat.rare.toString(),
              )
            : cat.rex != 0
                ? CustomInfoWidget(
                    cat: cat,
                    text: 'Rex',
                    percent: cat.rex.toDouble() / 5,
                    centerText: cat.rex.toString(),
                  )
                : Container(),
        cat.natural != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Natural',
                percent: cat.natural.toDouble() / 5,
                centerText: cat.natural.toString(),
              )
            : Container(),
        cat.shortLegs != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Short Legs',
                percent: cat.shortLegs.toDouble() / 5,
                centerText: cat.shortLegs.toString(),
              )
            : Container(),
        cat.childFriendly != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Child Friendly',
                percent: cat.childFriendly.toDouble() / 5,
                centerText: cat.childFriendly.toString(),
              )
            : Container(),
        cat.dogFriendly != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Dog Friendly',
                percent: cat.dogFriendly.toDouble() / 5,
                centerText: cat.dogFriendly.toString(),
              )
            : Container(),
        cat.grooming != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Grooming',
                percent: cat.grooming.toDouble() / 5,
                centerText: cat.grooming.toString(),
              )
            : Container(),
        cat.adaptability != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Adaptability',
                percent: cat.adaptability.toDouble() / 5,
                centerText: cat.adaptability.toString(),
              )
            : Container(),
        cat.hairless != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Hairless',
                percent: cat.hairless.toDouble() / 5,
                centerText: cat.hairless.toString(),
              )
            : Container(),
        cat.socialNeeds != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Social Needs',
                percent: cat.socialNeeds.toDouble() / 5,
                centerText: cat.socialNeeds.toString(),
              )
            : Container(),
        cat.sheddingLevel != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Shedding Level',
                percent: cat.sheddingLevel.toDouble() / 5,
                centerText: cat.sheddingLevel.toString(),
              )
            : Container(),
        cat.strangerFriendly != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Stranger Friendly',
                percent: cat.strangerFriendly.toDouble() / 5,
                centerText: cat.strangerFriendly.toString(),
              )
            : Container(),
        cat.vocalisation != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Vocalisation',
                percent: cat.vocalisation.toDouble() / 5,
                centerText: cat.vocalisation.toString(),
              )
            : Container(),
        cat.experimental != 0
            ? CustomInfoWidget(
                cat: cat,
                text: 'Experimental',
                percent: cat.experimental.toDouble() / 5,
                centerText: cat.experimental.toString(),
              )
            : Container(),
      ],
    );
  }
}
