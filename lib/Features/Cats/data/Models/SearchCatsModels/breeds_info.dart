import 'package:equatable/equatable.dart';
import 'package:pets_app/Features/Cats/data/Models/CatsModels/cats_wights_model.dart';

class BreedInfo extends Equatable {
  final Weight weight;
  final String id;
  final String name;
  final String cfaUrl;
  final String vetstreetUrl;
  final String vcahospitalsUrl;
  final String temperament;
  final String origin;
  final String countryCodes;
  final String countryCode;
  final String description;
  final String lifeSpan;
  final int indoor;
  final int lap;
  final String altNames;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  final int suppressedTail;
  final int shortLegs;
  final String wikipediaUrl;
  final int hypoallergenic;
  final String referenceImageId;

  const BreedInfo({
    required this.weight,
    required this.id,
    required this.name,
    required this.cfaUrl,
    required this.vetstreetUrl,
    required this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.lap,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.wikipediaUrl,
    required this.hypoallergenic,
    required this.referenceImageId,
  });

  @override
  List<Object?> get props => [
        weight,
        id,
        name,
        cfaUrl,
        vetstreetUrl,
        vcahospitalsUrl,
        temperament,
        origin,
        countryCodes,
        countryCode,
        description,
        lifeSpan,
        indoor,
        lap,
        altNames,
        adaptability,
        affectionLevel,
        childFriendly,
        dogFriendly,
        energyLevel,
        grooming,
        healthIssues,
        intelligence,
        sheddingLevel,
        socialNeeds,
        strangerFriendly,
        vocalisation,
        experimental,
        hairless,
        natural,
        rare,
        rex,
        suppressedTail,
        shortLegs,
        wikipediaUrl,
        hypoallergenic,
        referenceImageId,
      ];

  factory BreedInfo.fromJson(Map<String, dynamic> json) {
    return BreedInfo(
      weight: Weight.fromJson(json['weight']),
      id: json['id'] as String,
      name: json['name'] as String,
      cfaUrl: json['cfa_url'] as String,
      vetstreetUrl: json['vetstreet_url'] as String,
      vcahospitalsUrl: json['vcahospitals_url'] as String,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      countryCodes: json['country_codes'] as String,
      countryCode: json['country_code'] as String,
      description: json['description'] as String,
      lifeSpan: json['life_span'] as String,
      indoor: json['indoor'] as int,
      lap: json['lap'] as int,
      altNames: json['alt_names'] as String,
      adaptability: json['adaptability'] as int,
      affectionLevel: json['affection_level'] as int,
      childFriendly: json['child_friendly'] as int,
      dogFriendly: json['dog_friendly'] as int,
      energyLevel: json['energy_level'] as int,
      grooming: json['grooming'] as int,
      healthIssues: json['health_issues'] as int,
      intelligence: json['intelligence'] as int,
      sheddingLevel: json['shedding_level'] as int,
      socialNeeds: json['social_needs'] as int,
      strangerFriendly: json['stranger_friendly'] as int,
      vocalisation: json['vocalisation'] as int,
      experimental: json['experimental'] as int,
      hairless: json['hairless'] as int,
      natural: json['natural'] as int,
      rare: json['rare'] as int,
      rex: json['rex'] as int,
      suppressedTail: json['suppressed_tail'] as int,
      shortLegs: json['short_legs'] as int,
      wikipediaUrl: json['wikipedia_url'] as String,
      hypoallergenic: json['hypoallergenic'] as int,
      referenceImageId: json['reference_image_id'] as String,
    );
  }
}
