import 'package:flutter/material.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/dogs_breeds_model.dart';
import 'package:pets_app/core/utils/app_styles.dart';
import 'package:pets_app/core/utils/colors.dart';

class DogInformation extends StatelessWidget {
  const DogInformation({
    super.key,
    required this.dog,
  });

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: Text(
                dog.name,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleSemiBold24.copyWith(color: primaryColor),
              ),
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
                              {dog.weight.imperial!}.isEmpty
                                  ? 'Not Specified'
                                  : '${dog.weight.imperial!} Kg',
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
                              'Height',
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
                              {dog.height.imperial}.isEmpty
                                  ? 'Not Specified'
                                  : '${dog.height.imperial} Cm',
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
                              'Breed Group',
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
                              {dog.breedGroup}.isEmpty
                                  ? 'Not Specified'
                                  : dog.breedGroup,
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
                              'Breed For',
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
                              {dog.bredFor}.isEmpty
                                  ? 'Not Specified'
                                  : dog.bredFor,
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
                              dog.origin.isEmpty ? 'Not Specified' : dog.origin,
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
                              {dog.lifeSpan}.isEmpty
                                  ? 'Not Specified'
                                  : dog.lifeSpan,
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
                              'Temperament',
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
                              {dog.temperament}.isEmpty
                                  ? 'Not Specified'
                                  : dog.temperament,
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
      ],
    );
  }
}
