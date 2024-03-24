import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class ProfileImageFull extends StatelessWidget {
  final String imageUrl;

  const ProfileImageFull({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
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
    );
  }
}
