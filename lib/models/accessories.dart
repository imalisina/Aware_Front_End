class Accessories {
  List<Accessory> accessories = getAccessories();
  static List<Accessory> getAccessories() {
    return data.map<Accessory>(Accessory.fromJSON).toList();
  }
}

class Accessory {
  final String name, picture, category, subCategory;

  const Accessory({
    required this.name,
    required this.picture,
    required this.category,
    required this.subCategory,
  });

  static Accessory fromJSON(json) => Accessory(
        name: json["name"],
        picture: json["picture"],
        category: json["category"],
        subCategory: json["subCategory"],
      );
}

// Accessories JSON data
const data = [
  {
    "id": 0,
    "name": "Daranzi Special Edition",
    "picture": "https://static.smallable.com/1583050-648x648q80/.jpg",
    "category": "Jewellery",
    "subCategory": "Keyrings",
  },
  {
    "id": 1,
    "name": "Rachel Comey Epslion",
    "picture": "https://static.smallable.com/1610645-648x648q80/.jpg",
    "category": "Jewellery",
    "subCategory": "Bracelets",
  },
  {
    "id": 1,
    "name": "Venessa Baroni",
    "picture": "https://static.smallable.com/1419980-720x720q80/.jpg",
    "category": "Accessories",
    "subCategory": "Eyewear",
  },
];
