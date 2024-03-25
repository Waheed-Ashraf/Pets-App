class ApiConstance {
  static const String baseUrl = "https://api.thecatapi.com/v1";
  static const String dogsBaseUrl = "https://api.thedogapi.com/v1";

  static const String apiKey =
      "live_k8gnKoUFciwxgVRlDlKsEyTDpww3fhoDVzTGZ0sOnQtBfMeO5RbNaFf20xCEyP98";
  static const String dogsApiKey =
      "live_8dBTJ7xjpj0JCTqMLztRt9vA5Zp1ZoUxS5DcNXum8gTfNsdNzD5qhCVcO3uodO59";

  static const String catBreedsList = "$baseUrl/breeds?api_key=$apiKey";

  static const String dogBreedsList = "$dogsBaseUrl/breeds?api_key=$dogsApiKey";

  static String searchByCatBreedsId(String breedsId) =>
      "$baseUrl/images/search?limit=10&breed_ids=$breedsId&api_key=$apiKey";

  static String searchByDogBreedsId(String breedsId) =>
      "$dogsBaseUrl/images/search?limit=10&breed_ids=$breedsId&api_key=$dogsApiKey";

  static const String catsImagesList = "$baseUrl/images/search?limit=10";

  static const String dogsImagesList = "$dogsBaseUrl/images/search?limit=10";

  static String catsSimilarImagesEndPoint({required String petName}) =>
      "$baseUrl/images/search?limit=10&breed_ids=$petName&api_key=$apiKey";

  static String dogsSimilarImagesEndPoint({required String petName}) =>
      "$dogsBaseUrl/images/search?limit=10&breed_ids=$petName&api_key=$dogsApiKey";

  static const String catsFavEndPoin =
      "https://api.thecatapi.com/v1/favourites";
  static const String dogsFavEndPoin =
      "https://api.thedogapi.com/v1/favourites";

  static String deletCatItmeEndPoint({required int favItemId}) =>
      "https://api.thecatapi.com/v1/favourites/$favItemId";

  static String deletDogItmeEndPoint({required int favItemId}) =>
      "https://api.thedogapi.com/v1/favourites/$favItemId";
}
