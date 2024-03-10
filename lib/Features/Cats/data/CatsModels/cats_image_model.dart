import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String id;
  final double width;
  final double height;
  final String url;

  const Image({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'] ?? '',
      width: (json['width'] ?? 0).toDouble(),
      height: (json['height'] ?? 0).toDouble(),
      url: json['url'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, width, height, url];
}
