import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  Future<SharedPreferences> _getSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  Future clear() async {
    var _prefs = await _getSharedPref();
    await _prefs.clear();
  }

  Future<String> getString(String? key) async {
    var _prefs = await _getSharedPref();
    return _prefs.getString(key!) ?? '';
  }

  Future setString(String key, String? value) async {
    var _prefs = await _getSharedPref();
    await _prefs.setString(key, value!);
  }
}
