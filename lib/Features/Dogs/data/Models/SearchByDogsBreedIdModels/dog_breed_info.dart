import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_wights_model.dart';
import 'package:pets_app/Features/Dogs/data/Models/DogsBreedsModels/hight_model.dart';

class DogBreedInfo extends Equatable {
  final Weight weight;
  final Height height;
  final int id;
  final String name;
  final String countryCode;
  final String bredFor;
  final String breedGroup;
  final String lifeSpan;
  final String temperament;
  final String origin;
  final String referenceImageId;

  const DogBreedInfo({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    required this.countryCode,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.referenceImageId,
  });

  @override
  List<Object?> get props => [
        weight,
        height,
        id,
        name,
        countryCode,
        bredFor,
        breedGroup,
        lifeSpan,
        temperament,
        origin,
        referenceImageId,
      ];

  factory DogBreedInfo.fromJson(Map<String, dynamic> json) {
    return DogBreedInfo(
      weight: Weight.fromJson(json['weight']),
      height: Height.fromJson(json['height']),
      id: json['id'] as int,
      name: json['name'] ?? '',
      countryCode: json['country_code'] ?? '',
      bredFor: json['bred_for'] ?? '',
      breedGroup: json['breed_group'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      referenceImageId: json['reference_image_id'] ?? '',
    );
  }
}
