import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Dogs/data/Models/SearchByDogsBreedIdModels/dog_breed_info.dart';

class SearchDogsByBreedsIdModel extends Equatable {
  final List<DogBreedInfo> breeds;
  final String id;
  final String url;
  final int width;
  final int height;

  const SearchDogsByBreedsIdModel({
    required this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  List<Object?> get props => [breeds, id, url, width, height];

  factory SearchDogsByBreedsIdModel.fromJson(Map<String, dynamic> json) {
    final breedsList = (json['breeds'] as List<dynamic>?)
        ?.map((e) => DogBreedInfo.fromJson(e as Map<String, dynamic>))
        .toList();

    return SearchDogsByBreedsIdModel(
      breeds: breedsList ?? [],
      id: json['id'] as String,
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }
}
