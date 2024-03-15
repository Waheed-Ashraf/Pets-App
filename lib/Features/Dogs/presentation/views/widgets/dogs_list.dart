import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/widgets/custom_error_widget.dart';
import 'package:pets_app/Core/widgets/custom_loading_indicator.dart';
import 'package:pets_app/Features/Dogs/presentation/controller/DogsViewCubit/dogs_view_cubit.dart';

class DogsList extends StatelessWidget {
  const DogsList({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width / 150).round();
    return BlocBuilder<DogsViewCubit, DogsViewState>(
      builder: (context, state) {
        if (state is DogsBreedsLoaded) {
          return MasonryGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.dogsBreedsList.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount),
            itemBuilder: (BuildContext context, int index) {
              return (state.dogsBreedsList[index].image) == null
                  ? Container()
                  : FadeInUp(
                      child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: state.dogsBreedsList[index].image!.url,
                              fit: BoxFit.cover,
                              placeholder: (BuildContext context, String url) =>
                                  SizedBox(
                                height:
                                    state.dogsBreedsList[index].image!.height *
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
                          )),
                    );
            },
          );
        } else if (state is SearchedDogsBreedsLoaded) {
          return MasonryGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.searchDogBreed.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount),
            itemBuilder: (BuildContext context, int index) {
              return FadeInUp(
                child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: state.searchDogBreed[index].url == ''
                          ? Container()
                          : CachedNetworkImage(
                              imageUrl: state.searchDogBreed[index].url,
                              fit: BoxFit.cover,
                              placeholder: (BuildContext context, String url) =>
                                  SizedBox(
                                // color: Colors.white,
                                height:
                                    state.searchDogBreed[index].height * .12,
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
                    )),
              );
            },
          );
        } else if (state is DogsBreedsListEmpty) {
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
        } else if (state is DogsBreedsFailuer) {
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
