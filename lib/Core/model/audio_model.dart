class AudioModel {
  final String name;
  final String url;

  AudioModel({required this.name, required this.url});
}

class RadioModel extends AudioModel {
  RadioModel({required super.name, required super.url});

  static List<RadioModel> radioList = [
    RadioModel(name: "Radio Ibrahim Al-Akdar", url: "url"),
    RadioModel(name: "Radio Al-Qaria Yassen", url: "url"),
    RadioModel(name: "Radio Ahmed Al-trabulsi", url: "url"),
    RadioModel(name: "Radio Addokali Mohammad Alalim", url: "url"),
    RadioModel(name: "Radio Ibrahim Al-Akdar", url: "url"),
  ];
}

class RecitersModel extends AudioModel {
  RecitersModel({required super.name, required super.url});
  static List<RecitersModel> recitersList = [
    RecitersModel(name: "Ibrahim Al-Akdar", url: "url"),
    RecitersModel(name: "Akram Alalaqmi", url: "url"),
    RecitersModel(name: "Majed Al-Enezi", url: "url"),
    RecitersModel(name: "Malik shaibat Alhamed", url: "url"),
    RecitersModel(name: "Ibrahim Al-Akdar", url: "url"),
  ];
}
