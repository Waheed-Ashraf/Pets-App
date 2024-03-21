import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';

class CustomInfoWidget extends StatelessWidget {
  const CustomInfoWidget(
      {super.key,
      required this.cat,
      required this.text,
      required this.centerText,
      required this.percent});

  final CatModel cat;
  final String text;
  final String centerText;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: SizedBox(
        width: 130,
        child: Card(
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 10, bottom: 2),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  text,
                  style:
                      AppStyles.styleRegular14.copyWith(color: secondaryColor),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CircularPercentIndicator(
                radius: 30,
                lineWidth: 8,
                percent: percent,
                center: Text(
                  centerText,
                  style: AppStyles.styleRegular16.copyWith(),
                ),
                animation: true,
                progressColor: secondaryColor,
                circularStrokeCap: CircularStrokeCap.round,
              )
            ],
          ),
        ),
      ),
    );
  }
}
