import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  final Future<SharedPreferences> _pref;

  AppSharedPreference() : _pref = SharedPreferences.getInstance();

  void saveString({required String key, required String value}) async {
    (await _pref).setString(key, value);
  }

  Future<String> getString({required String key}) async {
    return (await _pref).getString(key) ?? DefaultTexts.EMPTY;
  }

  void saveImages({required String itemId, required String images}) async {
    (await _pref).setString(itemId, images);
  }

  Future<String> getImages({required String itemId}) async {
    return (await _pref).getString(itemId) ?? DefaultTexts.EMPTY;
  }
}
