import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static final Future<SharedPreferences> _pref =
      SharedPreferences.getInstance();

  static void saveString({required String key, required String value}) async {
    (await _pref).setString(key, value);
  }

  static Future<String> getString({required String key}) async {
    return (await _pref).getString(key) ?? "";
  }
}
