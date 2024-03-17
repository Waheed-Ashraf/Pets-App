import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cat_information.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_model.dart';
import 'package:pets_app/core/utils/colors.dart';

class CatsDetailsView extends StatelessWidget {
  const CatsDetailsView({
    super.key,
    required this.cat,
  });

  final CatModel cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: primaryColor,
            expandedHeight: MediaQuery.of(context).size.width *
                (cat.image!.height / cat.image!.width),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: cat.image!.url,
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
              child: CatInformation(cat: cat),
            ),
          ),
        ],
      ),
    );
  }
}
