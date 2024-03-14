import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Explore/data/ExploreModels/image_model.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_wights_model.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/hight_model.dart';

class DogModel extends Equatable {
  final Weight weight;
  final Height height;
  final int id;
  final String name;
  final String bredFor;
  final String breedGroup;
  final String lifeSpan;
  final String temperament;
  final String origin;
  final String referenceImageId;
  final ImageModel? image;

  const DogModel({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.referenceImageId,
    this.image,
  });

  @override
  List<Object?> get props => [
        weight,
        height,
        id,
        name,
        bredFor,
        breedGroup,
        lifeSpan,
        temperament,
        origin,
        referenceImageId,
        image,
      ];

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      weight: Weight.fromJson(json['weight']),
      height: Height.fromJson(json['height']),
      id: json['id'] as int,
      name: json['name'] ?? '',
      bredFor: json['bred_for'] ?? '',
      breedGroup: json['breed_group'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      referenceImageId: json['reference_image_id'] ?? '',
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }
}
