import 'package:shared_preferences/shared_preferences.dart';

Set<String> favoritBreedsIds = {};
Set<String> favoritCatsIds = {};
Set<String> favoritDogsIds = {};
Set<int> favoritItemsIds = {};

// Future<void> initFavoritData() async {
//   final prefs = await SharedPreferences.getInstance();
//   favoritBreedsIds = prefs.getStringList('favoritBreedsIds')?.toSet() ?? {};
//   favoritCatsIds = prefs.getStringList('favoritCatsIds')?.toSet() ?? {};
//   favoritDogsIds = prefs.getStringList('favoritDogsIds')?.toSet() ?? {};
//   favoritItemsIds =
//       prefs.getStringList('favoritItemsIds')?.map(int.parse).toSet() ?? {};
// }

// Future<void> saveFavoritData() async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setStringList('favoritBreedsIds', favoritBreedsIds.toList());
//   prefs.setStringList('favoritCatsIds', favoritCatsIds.toList());
//   prefs.setStringList('favoritDogsIds', favoritDogsIds.toList());
//   prefs.setStringList(
//       'favoritItemsIds', favoritItemsIds.map((id) => id.toString()).toList());
// }
