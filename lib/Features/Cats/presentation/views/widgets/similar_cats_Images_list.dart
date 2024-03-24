import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Core/widgets/custom_error_widget.dart';
import 'package:pets_app/Features/Cats/presentation/controller/SimilarCatsImagesCubit/similar_cats_images_cubit.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';

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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageListViewer(
                        firestImageToShow: index,
                        // imageUrl: state.similarImagesList[index].url,
                        items: state.similarImagesList);
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
                      imageUrl: state.similarImagesList[index].url,
                      fit: BoxFit.cover,
                      placeholder: (BuildContext context, String url) =>
                          SizedBox(
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

class ImageListViewer extends StatelessWidget {
  final List<ImageModel> items;
//  int indexx ;
  final int firestImageToShow;

  const ImageListViewer({
    //  required this.indexx,
    super.key,
    required this.items,
    required this.firestImageToShow,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _downloadImage(context, items[firestImageToShow].url);
        },
        child: const Icon(Icons.download),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          initialPage: firestImageToShow,
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
        ),
        items: items.map(
          (item) {
            return CachedNetworkImage(
              imageUrl: item.url,
              fit: BoxFit.contain,
            );
          },
        ).toList(),
      ),
    );
  }

  Future<void> _downloadImage(BuildContext context, String imageUrl) async {
    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/myfile.jpg';
    try {
      await Dio().download(imageUrl, path);
      await GallerySaver.saveImage(path, albumName: 'Pets App');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Download Complete',
            style: AppStyles.styleBold16,
          ),
          content: Text(
            'The image has been saved to your device.',
            style: AppStyles.styleBold16,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      // Show an error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error',
            style: AppStyles.styleBold16,
          ),
          content: Text(
            'Failed to download the image.',
            style: AppStyles.styleBold16,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
