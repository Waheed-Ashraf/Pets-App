import 'package:equatable/equatable.dart';

class FavoritModel extends Equatable {
  final int id;
  final String imageId;
  final FavImage? image;

  const FavoritModel({
    required this.id,
    required this.imageId,
    required this.image,
  });

  @override
  List<Object?> get props => [id, imageId, image];

  factory FavoritModel.fromJson(Map<String, dynamic> json) {
    return FavoritModel(
      id: json['id'] as int,
      imageId: json['image_id'] as String,
      image: json['image'] != null
          ? FavImage.fromJson(json['image'] as Map<String, dynamic>)
          : null,
    );
  }
}

class FavImage extends Equatable {
  final String id;
  final String url;

  const FavImage({
    required this.id,
    required this.url,
  });

  @override
  List<Object?> get props => [id, url];

  factory FavImage.fromJson(Map<String, dynamic> json) {
    return FavImage(
      id: json['id'] as String,
      url: json['url'] as String,
    );
  }
}
