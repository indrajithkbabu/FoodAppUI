import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static const _keyFavorites = 'favorites';

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<List<String>> getFavorites() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> favorites = prefs.getStringList(_keyFavorites) ?? [];
    return favorites;
  }

  static Future<void> addFavorite(String itemId) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> favorites = await getFavorites();
    if (!favorites.contains(itemId)) {
      favorites.add(itemId);
      await prefs.setStringList(_keyFavorites, favorites);
    }
  }

  static Future<void> removeFavorite(String itemId) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> favorites = await getFavorites();
    favorites.remove(itemId);
    await prefs.setStringList(_keyFavorites, favorites);
  }

  static Future<bool> isFavorite(String itemId) async {
    final List<String> favorites = await getFavorites();
    return favorites.contains(itemId);
  }
}
