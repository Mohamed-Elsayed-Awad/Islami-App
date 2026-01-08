import 'package:shared_preferences/shared_preferences.dart';

class SharedHadeth {
  static late SharedPreferences _sharedPreferences;
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveHadethIndex(int index) async {
    return await _sharedPreferences.setInt(
      HadethCacheKey.hadethIndexKey,
      index,
    );
  }

  static int getHadethIndex() {
    return _sharedPreferences.getInt(HadethCacheKey.hadethIndexKey) ?? 0;
  }
}

class HadethCacheKey {
  static const String hadethIndexKey = "hadeth";
}
