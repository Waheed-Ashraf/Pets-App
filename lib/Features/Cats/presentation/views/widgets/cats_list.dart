import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pets_app/Core/widgets/custom_error_widget.dart';
import 'package:pets_app/Core/widgets/custom_loading_indicator.dart';
import 'package:pets_app/Features/Cats/presentation/controller/CatsBreedsCubit/cats_breeds_cubit.dart';

class CatsList extends StatelessWidget {
  const CatsList({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width / 150).round();
    return BlocBuilder<CatsBreedsCubit, CatsBreedsState>(
      builder: (context, state) {
        if (state is CatsBreedsLoaded) {
          return FadeInUp(
            duration: const Duration(milliseconds: 400),
            child: MasonryGridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 50,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: (state.catsBreedsList[index].image) == null
                          ? Container()
                          : CachedNetworkImage(
                              imageUrl: state.catsBreedsList[index].image!.url,
                              fit: BoxFit.cover,
                              // placeholder: (context, url) => Shimmer.fromColors(
                              //   baseColor: Colors.grey[850]!,
                              //   highlightColor: Colors.grey[800]!,
                              //   child: Container(
                              //     height: state.catsBreedsList[index].image!.height,

                              //     decoration: BoxDecoration(
                              //       color: Colors.black,
                              //       borderRadius: BorderRadius.circular(16.0),
                              //     ),
                              //   ),
                              // ),
                            )),
                );
              },
            ),
          );
        } else if (state is CatsBreedsFailuer) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator(
            hight: MediaQuery.of(context).size.height - 100,
            loadingImg: 'assets/images/loading.json',
          );
        }
      },
    );
  }
}
