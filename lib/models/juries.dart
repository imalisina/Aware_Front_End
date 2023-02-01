class Juries {
  List<Jury> juries = getJuries();
  static List<Jury> getJuries() {
    return data.map<Jury>(Jury.fromJSON).toList();
  }
}

class Jury {
  final String juryName, juryPosition, juryProfileImg;

  const Jury(
      {required this.juryName,
      required this.juryPosition,
      required this.juryProfileImg});

  static Jury fromJSON(json) => Jury(
      juryName: json["juryName"],
      juryPosition: json["juryPosition"],
      juryProfileImg: json["juryProfileImg"]);
}

// Juries JSON data
const data = [
  {
    "id": 0,
    "juryName": "Alan Wornez",
    "juryPosition": "Head Jury",
    "juryProfileImg": "https://mui.com/static/images/avatar/2.jpg",
  },
  {
    "id": 0,
    "juryName": "Alvane Juriazo",
    "juryPosition": "Senior Jury",
    "juryProfileImg": "https://mui.com/static/images/avatar/1.jpg",
  },
];