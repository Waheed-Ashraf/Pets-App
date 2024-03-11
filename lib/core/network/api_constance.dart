class ApiConstance {
  static const String baseUrl = "https://api.thecatapi.com/v1";
  static const String baseUrlDogs = "https://api.thedogapi.com/v1";
  static const String apiKey =
      "live_k8gnKoUFciwxgVRlDlKsEyTDpww3fhoDVzTGZ0sOnQtBfMeO5RbNaFf20xCEyP98";

  static const String catBreedsList = "$baseUrl/breeds?api_key=$apiKey";

  static String searchByCatBreedsId(String breedsId) =>
      "$baseUrl/images/search?limit=10&breed_ids=$breedsId&api_key=$apiKey";

  static const String dogBreedsList = "$baseUrl/breeds?api_key=$apiKey";
}
