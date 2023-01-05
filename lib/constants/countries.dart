class Countries {
  List<Country> countries = getCountries();
  static List<Country> getCountries() {
    return data.map<Country>(Country.fromJSON).toList();
  }
}

class Country {
  final String name, flag, code;
  const Country({required this.name, required this.flag, required this.code});

  static Country fromJSON(json) =>
      Country(name: json['name'], flag: json['flag'], code: json['code']);
}

// !IMPORTANT! ****ADD ALL COUNTRIES WITH THEIR FLAGS****
// Country JSON data
const data = [
  // {"name": "United States", "flag": "us.png", "code": '1'},
];
