import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_app/Core/widgets/custom_error_widget.dart';
import 'package:pets_app/Features/Cats/presentation/controller/SimilarCatsImagesCubit/similar_cats_images_cubit.dart';
import 'package:pets_app/Features/Explore/presentation/views/image_screen.dart';

class SimilarImagesList extends StatelessWidget {
  const SimilarImagesList({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width / 150).round();

    return BlocBuilder<SimilarCatsImagesCubit, SimilarCatsImagesState>(
      builder: (context, state) {
        if (state is SimilarCatsImagesLoaded) {
          return MasonryGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.similarImagesList.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ImageScreen(
                              imageUrl: state.similarImagesList[index].url,
                              heroTag: index.toString());
                        }));
                      },
                      child: CachedNetworkImage(
                        imageUrl: state.similarImagesList[index].url,
                        fit: BoxFit.cover,
                        placeholder: (BuildContext context, String url) =>
                            SizedBox(
                          // color: Colors.white,
                          height: 100,
                          child: Center(
                            child: Lottie.asset(
                                'assets/images/image-placeholder.json',
                                width: 40,
                                fit: BoxFit.contain),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is SimilarCatsImagesFailuer) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
