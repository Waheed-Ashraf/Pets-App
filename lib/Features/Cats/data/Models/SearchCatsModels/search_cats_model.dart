import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Cats/data/Models/SearchCatsModels/breeds_info.dart';

class SearchCatBreedModel extends Equatable {
  final List<BreedInfo> breeds;
  final String id;
  final String url;
  final int width;
  final int height;

  const SearchCatBreedModel({
    required this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  List<Object?> get props => [breeds, id, url, width, height];

  factory SearchCatBreedModel.fromJson(Map<String, dynamic> json) {
    final breedsList = (json['breeds'] as List<dynamic>)
        .map((e) => BreedInfo.fromJson(e as Map<String, dynamic>))
        .toList();

    return SearchCatBreedModel(
      breeds: breedsList,
      id: json['id'] as String,
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }
}
