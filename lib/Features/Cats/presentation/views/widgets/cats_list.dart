import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/widgets/custom_error_widget.dart';
import 'package:pets_app/Core/widgets/custom_loading_indicator.dart';
import 'package:pets_app/Features/Cats/presentation/controller/CatsBreedsCubit/cats_breeds_cubit.dart';
import 'package:pets_app/Features/Cats/presentation/controller/SimilarCatsImagesCubit/similar_cats_images_cubit.dart';
import 'package:pets_app/Features/Cats/presentation/views/widgets/cats_details_view.dart';
import 'package:pets_app/Features/Explore/presentation/views/image_screen.dart';

class CatsList extends StatelessWidget {
  const CatsList({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width / 150).round();
    return BlocBuilder<CatsBreedsCubit, CatsBreedsState>(
      builder: (context, state) {
        if (state is CatsBreedsLoaded) {
          return FadeInUp(
            child: MasonryGridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.catsBreedsList.length,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount),
              itemBuilder: (BuildContext context, int index) {
                return (state.catsBreedsList[index].image) == null
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          BlocProvider.of<SimilarCatsImagesCubit>(context)
                              .getCatsSimilarImages(
                                  catName: state.catsBreedsList[index].id);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CatsDetailsView(
                              cat: state.catsBreedsList[index],
                            );
                          }));
                        },
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: state.catsBreedsList[index].image!.url,
                              fit: BoxFit.cover,
                              placeholder: (BuildContext context, String url) =>
                                  SizedBox(
                                // color: Colors.white,
                                height:
                                    state.catsBreedsList[index].image!.height *
                                        .12,
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
                      );
              },
            ),
          );
        } else if (state is SearchedCatsBreedsLoaded) {
          return FadeInUp(
            child: MasonryGridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.searchCatBreed.length,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageScreen(
                                imageUrl: state.searchCatBreed[index].url,
                                heroTag: index.toString()),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: state.searchCatBreed[index].url,
                        fit: BoxFit.cover,
                        placeholder: (BuildContext context, String url) =>
                            SizedBox(
                          // color: Colors.white,
                          height: state.searchCatBreed[index].height * .12,
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
                );
              },
            ),
          );
        } else if (state is CatsBreedsListEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/images/search_view.json',
                  width: MediaQuery.of(context).size.width * .7,
                  fit: BoxFit.contain,
                ),
                Text(
                  'There is no pictures for this pet, Try another name',
                  textAlign: TextAlign.center,
                  style: AppStyles.styleBold16.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),
          );
        } else if (state is CatsBreedsFailuer) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator(
            hight: MediaQuery.of(context).size.height - 200,
            loadingImg: 'assets/images/loading.json',
          );
        }
      },
    );
  }
}
