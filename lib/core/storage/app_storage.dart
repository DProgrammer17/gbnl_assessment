import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  late final SharedPreferences prefs;

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setStringPrefs({required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    return;
  }

  String getStringPref(String key) {
    return prefs.getString(key) ?? '';
  }
}
