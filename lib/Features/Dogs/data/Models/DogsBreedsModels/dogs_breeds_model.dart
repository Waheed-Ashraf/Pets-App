import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_image_model.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_wights_model.dart';

class DogBreed extends Equatable {
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
  final Image? image;

  const DogBreed({
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

  factory DogBreed.fromJson(Map<String, dynamic> json) {
    return DogBreed(
      weight: Weight.fromJson(json['weight']),
      height: Height.fromJson(json['height']),
      id: json['id'] as int,
      name: json['name'] as String,
      bredFor: json['bred_for'] as String,
      breedGroup: json['breed_group'] as String,
      lifeSpan: json['life_span'] as String,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      referenceImageId: json['reference_image_id'] as String,
      image: json['image'] != null ? Image.fromJson(json['image']) : null,
    );
  }
}

class Height extends Equatable {
  final String imperial;
  final String metric;

  const Height({
    required this.imperial,
    required this.metric,
  });

  @override
  List<Object?> get props => [imperial, metric];

  factory Height.fromJson(Map<String, dynamic> json) {
    return Height(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );
  }
}
