import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cat_information.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';

class CatsDetailsView extends StatelessWidget {
  const CatsDetailsView({super.key, required this.cat});

  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: cat.image!.url,
                  fit: BoxFit.cover,
                  placeholder: (BuildContext context, String url) => SizedBox(
                    height: cat.image!.height * .12,
                    child: Center(
                      child: Lottie.asset(
                          'assets/images/image-placeholder.json',
                          width: 40,
                          fit: BoxFit.contain),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                  top: 40,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue, // Change this to your desired color
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: CatInformation(cat: cat),
            ),
          ),
        ],
      ),
    );
  }
}
