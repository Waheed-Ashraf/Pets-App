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
          return MasonryGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.catsBreedsList.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount),
            itemBuilder: (BuildContext context, int index) {
              return (state.catsBreedsList[index].image) == null
                  ? Container()
                  : Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: state.catsBreedsList[index].image!.url,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    );
            },
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
