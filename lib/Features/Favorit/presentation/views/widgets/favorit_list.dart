import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/widgets/custom_error_widget.dart';
import 'package:pets_app/Core/widgets/snack_bar.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/AllFavoritCubit/all_favorit_cubit.dart';
import 'package:pets_app/Features/Favorit/presentation/controller/FavCatCubit/favorit_cubit.dart';

class FavoritList extends StatelessWidget {
  const FavoritList({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = (MediaQuery.of(context).size.width / 150).round();

    return BlocBuilder<FavoritCubit, FavoritState>(
      builder: (context, state) {
        if (state is FavoritCatsListLoaded) {
          return FadeInUp(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Favorit Cats :',
                    style: AppStyles.styleBold16,
                  ),
                  MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.favList.length,
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount),
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(state.favList[index].id.toString()),
                        background: const Center(
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        onDismissed: (direction) {
                          favoritBreedsIds
                              .remove(state.favList[index].image!.id);
                          favoritCatsIds.remove(state.favList[index].image!.id);

                          showSnackBar(context,
                              color: Colors.red, message: 'Pet deleted');
                          BlocProvider.of<FavoritCubit>(context)
                              .deletCatFromFavoritList(state.favList[index].id);
                          BlocProvider.of<AllFavoritCubit>(context)
                              .checkIfFavoritListEmpty();
                        },
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: state.favList[index].image!.url,
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
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state is FavoritCatsError) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

// class FavoritDogsList extends StatelessWidget {
//   const FavoritDogsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     int crossAxisCount = (MediaQuery.of(context).size.width / 150).round();

//     return BlocBuilder<FavoritCubit, FavoritState>(
//       builder: (context, state) {
//         if (state is FavoritDogsListLoaded) {
//           return FadeInUp(
//             child: Column(
//               children: [
//                 Text(
//                   'Favorit Dogs :',
//                   style: AppStyles.styleBold16,
//                 ),
//                 MasonryGridView.builder(
//                   shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: state.favList.length,
//                   gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: crossAxisCount),
//                   itemBuilder: (BuildContext context, int index) {
//                     return Dismissible(
//                       key: Key(state.favList[index].id.toString()),
//                       background: const Center(
//                         child: Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         ),
//                       ),
//                       onDismissed: (direction) {
//                         favoritBreedsIds.remove(state.favList[index].image!.id);
//                         favoritDogsIds.remove(state.favList[index].image!.id);

//                         showSnackBar(context,
//                             color: Colors.red, message: 'Dog deleted');
//                         BlocProvider.of<FavoritCubit>(context)
//                             .deletDogFromFavoritList(state.favList[index].id);
//                       },
//                       child: Card(
//                         elevation: 6,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16.0),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: CachedNetworkImage(
//                             imageUrl: state.favList[index].image!.url,
//                             fit: BoxFit.cover,
//                             placeholder: (BuildContext context, String url) =>
//                                 SizedBox(
//                               // color: Colors.white,
//                               height: 100,

//                               child: Center(
//                                 child: Lottie.asset(
//                                     'assets/images/image-placeholder.json',
//                                     width: 40,
//                                     fit: BoxFit.contain),
//                               ),
//                             ),
//                             errorWidget: (context, url, error) =>
//                                 const Icon(Icons.error),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         } else if (state is FavoritDogsListEmpty) {
//           return const SizedBox();
//         } else if (state is FavoritError) {
//           return CustomErrorWidget(errMessage: state.errorMessage);
//         } else {
//           return const SizedBox();
//         }
//       },
//     );
//   }
// }
