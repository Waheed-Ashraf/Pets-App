import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/dogs_breeds_model.dart';
import 'package:pets_app/Features/Dogs/presentation/views/widgets/dog_information.dart';
import 'package:pets_app/core/utils/colors.dart';

class DogsDetailsViewBody extends StatelessWidget {
  const DogsDetailsViewBody({super.key, required this.dog});

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: primaryColor,
          expandedHeight: MediaQuery.of(context).size.width *
              (dog.image!.height / dog.image!.width),
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl: dog.image!.url,
              fit: BoxFit.cover,
              placeholder: (BuildContext context, String url) => SizedBox(
                height: 200.0,
                child: Center(
                  child: Lottie.asset(
                    'assets/images/image-placeholder.json',
                    width: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          pinned: true,
          floating: false,
          snap: false,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverToBoxAdapter(
            child: DogInformation(dog: dog),
          ),
        ),
      ],
    );
  }
}
