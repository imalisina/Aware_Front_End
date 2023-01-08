class Countries {
  List<Country> countries = getCountries();
  static List<Country> getCountries() {
    return data.map<Country>(Country.fromJSON).toList();
  }
}

class Country {
  final String name, flag, code;
  final List states;
  const Country(
      {required this.name,
      required this.flag,
      required this.code,
      required this.states});

  static Country fromJSON(json) => Country(
      name: json['name'],
      flag: json['flag'],
      code: json['code'],
      states: json["states"]);
}

// !IMPORTANT! ****ADD ALL COUNTRIES WITH THEIR FLAGS****
// Country JSON data
const data = [
  {
    "name": "Iran",
    "flag": "ir.png",
    "code": '1',
    "states": [
      "Markazi",
      "Khuzestan",
      "Ilam",
      "Kermanshah",
      "Gilan",
      "Chaharmahal and Bakhtiari",
      "Qom",
      "Isfahan",
      "West Azarbaijan",
      "Zanjan",
      "Kohgiluyeh and Boyer-Ahmad",
      "Razavi Khorasan",
      "Lorestan",
      "Alborz",
      "South Khorasan",
      "Sistan and Baluchestan",
      "Bushehr",
      "Golestan",
      "Ardabil",
      "Kurdistan",
      "Yazd",
      "Hormozgan",
      "Mazandaran",
      "Fars",
      "Semnan",
      "Qazvin",
      "North Khorasan",
      "Kerman",
      "East Azerbaijan",
      "Tehran",
      "Hamadan",
    ],
  },
];
