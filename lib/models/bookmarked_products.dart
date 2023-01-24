class BookmarkedProducts {
  List<BookmarkedProduct> bookmarkedProducts = getBookmarkedProducts();
  static List<BookmarkedProduct> getBookmarkedProducts() {
    return data.map<BookmarkedProduct>(BookmarkedProduct.fromJSON).toList();
  }
}

class BookmarkedProduct {
  final String title,
      brand,
      price,
      market,
      category,
      discountCode,
      brandLogo,
      productImage,
      productUrl;
  final bool isBookmarked;
  final int productId;
  const BookmarkedProduct(
      {required this.productId,
      required this.title,
      required this.brand,
      required this.price,
      required this.market,
      required this.category,
      required this.discountCode,
      required this.brandLogo,
      required this.productImage,
      required this.productUrl,
      required this.isBookmarked});
  static BookmarkedProduct fromJSON(json) => BookmarkedProduct(
      productId: json["id"],
      title: json["title"],
      brand: json["brand"],
      price: json["price"],
      market: json["market"],
      category: json["category"],
      discountCode: json["discountCode"],
      brandLogo: json["brandLogo"],
      productImage: json["productImage"],
      productUrl: json["productUrl"],
      isBookmarked: json["isBookmarked"]);
}

// Bookmarked products JSON data
const data = [
  {
    "id": 0,
    "title": "The Great Bardana",
    "brand": "Smallable",
    "price": "290",
    "market": "https://www.smallable.com",
    "category": "Casual",
    "discountCode": "SDAO51@9908-37AWM",
    "brandLogo":
        "https://brandslogos.com/wp-content/uploads/images/zara-logo-black-and-white-1.png",
    "productImage": "https://static.smallable.com/1404656-720x720q80/.jpg",
    "productUrl":
        "https://www.smallable.com/en/product/the-kerchief-bandana-print-shirt-navy-blue-the-great-261428",
    "isBookmarked": true,
  },
  {
    "id": 1,
    "title": "Piu Piu Pantalon",
    "brand": "Smallable",
    "price": "711",
    "market": "https://www.smallable.com",
    "category": "Smart Casual",
    "discountCode": "SDAO51@9908-37AWM",
    "brandLogo":
        "https://brandslogos.com/wp-content/uploads/images/zara-logo-black-and-white-1.png",
    "productImage": "https://static.smallable.com/1600888-720x720q80/.jpg",
    "productUrl":
        "https://www.smallable.com/en/product/pantalon-toile-a-rayures-yellow-piupiuchick-307949",
    "isBookmarked": true,
  },
  {
    "id": 2,
    "title": "Sweat Femme Tate ",
    "brand": "Smallable",
    "price": "171",
    "market": "https://www.smallable.com",
    "category": "Smart Casual",
    "discountCode": "SDAO51@9908-37AWM",
    "brandLogo":
        "https://brandslogos.com/wp-content/uploads/images/zara-logo-black-and-white-1.png",
    "productImage": "https://static.smallable.com/1598618-720x720q80/.jpg",
    "productUrl":
        "https://www.smallable.com/en/product/sweat-tate-collection-femme-orange-bellerose-301550",
    "isBookmarked": true,
  },
  {
    "id": 3,
    "title": "Parka Laos Belle",
    "brand": "Smallable",
    "price": "295",
    "market": "https://www.smallable.com",
    "category": "Smart Casual",
    "discountCode": "SDAO51@9908-37AWM",
    "brandLogo":
        "https://brandslogos.com/wp-content/uploads/images/zara-logo-black-and-white-1.png",
    "productImage": "https://static.smallable.com/1601502-720x720q80/.jpg",
    "productUrl":
        "https://www.smallable.com/en/product/parka-laos-collection-femme-green-clay-bellerose-301495",
    "isBookmarked": true,
  },
];
