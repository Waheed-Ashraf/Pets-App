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
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            text,
            style: AppStyles.styleSemiBold16.copyWith(color: primaryColor),
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
    );
  }
}
