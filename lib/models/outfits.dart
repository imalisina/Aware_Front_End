class Outfits {
  List<Outfit> outfits = getOutfits();
  static List<Outfit> getOutfits() {
    return data.map<Outfit>(Outfit.fromJSON).toList();
  }
}

class Outfit {
  final String name, picture, category, subCategory;

  const Outfit(
      {required this.name,
      required this.picture,
      required this.category,
      required this.subCategory});

  static Outfit fromJSON(json) => Outfit(
      name: json["name"],
      picture: json["picture"],
      category: json["category"],
      subCategory: json["subCategory"]);
}

// Outfits JSON data
const data = [
  {
    "id": 0,
    "name": "Pink Poplin Long Shirt",
    "picture": "https://static.smallable.com/1590291-720x720q80/.jpg",
    "category": "Clothing",
    "subCategory": "Dress",
  },
  {
    "id": 1,
    "name": "Sweat Femme Tate",
    "picture": "https://static.smallable.com/1598618-720x720q80/.jpg",
    "category": "Clothing",
    "subCategory": "Hoodie",
  },
  {
    "id": 2,
    "name": "Piu Piu Pantalon",
    "picture": "https://static.smallable.com/1600888-720x720q80/.jpg",
    "category": "Clothing",
    "subCategory": "Pants",
  },
];
