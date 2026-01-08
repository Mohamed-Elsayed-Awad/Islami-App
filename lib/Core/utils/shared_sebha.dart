import 'package:shared_preferences/shared_preferences.dart';

class SharedSebha {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveCounter(int counter) async {
    return await _sharedPreferences.setInt(SebhaCacheKeys.counterKey, counter);
  }

  static Future<bool> saveTasbeha(int tasbeha) async {
    return await _sharedPreferences.setInt(SebhaCacheKeys.tasbehaKey, tasbeha);
  }

  static int getCounter() {
    return _sharedPreferences.getInt(SebhaCacheKeys.counterKey) ?? 0;
  }

  static int getTasbeha() {
    return _sharedPreferences.getInt(SebhaCacheKeys.tasbehaKey) ?? 0;
  }
}

class SebhaCacheKeys {
  static const String counterKey = "counter";
  static const String tasbehaKey = "tasbeha";
}
