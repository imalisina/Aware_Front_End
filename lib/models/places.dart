class Places {
  List<Place> places = getPlaces();
  static List<Place> getPlaces() {
    return data.map<Place>(Place.fromJSON).toList();
  }
}

class Place {
  final String placeName, streetName;

  const Place({required this.placeName, required this.streetName});

  static Place fromJSON(json) =>
      Place(placeName: json["placeName"], streetName: json["streetName"]);
}

// Places JSON data
const data = [
  {
    "id": 0,
    "placeName": "London Cafe",
    "streetName": "Fino",
  },
  {
    "id": 1,
    "placeName": "Green Grand Park",
    "streetName": "Langard",
  },
  {
    "id": 2,
    "placeName": "Aspondra Center",
    "streetName": "Galle",
  },
];
