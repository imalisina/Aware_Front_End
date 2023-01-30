class Relations {
  List<Relation> relations = getRelations();
  static List<Relation> getRelations() {
    return data.map<Relation>(Relation.fromJSON).toList();
  }
}

class Relation {
  final String name, gender, relation, age;

  const Relation(
      {required this.name,
      required this.gender,
      required this.relation,
      required this.age});

  static Relation fromJSON(json) => Relation(
      name: json["name"],
      gender: json["gender"],
      relation: json["relation"],
      age: json["age"]);
}

// Relation JSON data
const data = [
  {
    "id": 0,
    "name": "Stephanie Jorio",
    "gender": "Female",
    "relation": "Friend",
    "age": "21",
  },
  {
    "id": 1,
    "name": "Alex Morinho",
    "gender": "Male",
    "relation": "Friend",
    "age": "18",
  },
  {
    "id": 2,
    "name": "Jane Doe",
    "gender": "Female",
    "relation": "Best-friend",
    "age": "25",
  },
  {
    "id": 3,
    "name": "Mark Caller",
    "gender": "Male",
    "relation": "Family",
    "age": "47",
  },
  {
    "id": 4,
    "name": "Julia Caller",
    "gender": "Female",
    "relation": "Family",
    "age": "45",
  },
];
