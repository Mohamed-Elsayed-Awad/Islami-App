import 'package:shared_preferences/shared_preferences.dart';

class SharedMostRecently {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveSuraList(int newIndex) async {
    final mostRecentList =
        _sharedPreferences.getStringList(MostRecentKey.mostRecentKey) ?? [];

    mostRecentList.remove(newIndex.toString());
    mostRecentList.insert(0, newIndex.toString());

    if (mostRecentList.length > 10) {
      mostRecentList.removeAt(10);
    }

    return await _sharedPreferences.setStringList(
      MostRecentKey.mostRecentKey,
      mostRecentList,
    );
  }

  static List<int> getSuraList() {
    List<String> mostRecent =
        _sharedPreferences.getStringList(MostRecentKey.mostRecentKey) ?? [];

    return mostRecent.map((element) => int.parse(element)).toList();
  }

  static Future<bool> clearList() async {
    return await _sharedPreferences.clear();
  }
}

class MostRecentKey {
  static const String mostRecentKey = "most";
}
