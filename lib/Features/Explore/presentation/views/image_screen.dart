import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pets_app/Core/utils/app_styles.dart';

class ImageScreen extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const ImageScreen({super.key, required this.imageUrl, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Image'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _downloadImage(context, imageUrl);
        },
        child: const Icon(Icons.download),
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (BuildContext context, String url) => Container(
              color: Colors.white
                  .withOpacity(0.5), // Set the color with transparency
              height: 200,
              child: Center(
                child: Lottie.asset(
                  'assets/images/image-placeholder.json',
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
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
