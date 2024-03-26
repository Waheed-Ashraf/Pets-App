import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets_app/Core/utils/app_styles.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';

class ImageListViewer extends StatelessWidget {
  final List<ImageModel> items;
  final int firestImageToShow;
  const ImageListViewer({
    super.key,
    required this.items,
    required this.firestImageToShow,
  });

  @override
  Widget build(BuildContext context) {
    int urlIndex = 0;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _downloadImage(context, items[urlIndex].url);
        },
        child: const Icon(Icons.download),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          initialPage: firestImageToShow,
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            index = urlIndex;
          },
        ),
        items: items.map(
          (item) {
            return CachedNetworkImage(
              imageUrl: item.url,
              fit: BoxFit.contain,
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
