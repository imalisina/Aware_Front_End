class Products {
  List<Product> products = getProducts();
  static List<Product> getProducts() {
    return data.map<Product>(Product.fromJSON).toList();
  }
}

class Product {
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

  const Product(
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

  static Product fromJSON(json) => Product(
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

// Product JSON data
const data = [
  {
    "id": 0,
    "title": "Pink Poplin Long Shirt",
    "brand": "C&A",
    "price": "379",
    "market": "https://wwww.ca.com",
    "category": "Elegant",
    "discountCode": "SDAO51@9908-37AWM",
    "brandLogo":
        "https://brandslogos.com/wp-content/uploads/images/large/ca-logo-black-and-white-1.png",
    "productImage": "https://static.smallable.com/1590291-720x720q80/.jpg",
    "productUrl":
        "https://www.smallable.com/en/product/summon-hoodie-purple-element-306573",
    "isBookmarked": false,
  },
  {
    "id": 1,
    "title": "The Great Bardana",
    "brand": "Nike",
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
    "id": 2,
    "title": "Escape Run 2",
    "brand": "Nike",
    "price": "155",
    "market": "https://www.nike.com",
    "category": "Sportswear",
    "discountCode": "SDAO51@9908-37AWM",
    "brandLogo":
        "https://www.edigitalagency.com.au/wp-content/uploads/nike-logo-png-black-icon-white-background-large-800x316.png",
    "productImage": "https://static.smallable.com/1593135-648x648q80/.jpg",
    "productUrl":
        "https://www.nike.com/in/t/escape-run-2-road-running-shoes-ktrfqG/DJ9976-200",
    "isBookmarked": false,
  },
  {
    "id": 3,
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
    "isBookmarked": false,
  },
  {
    "id": 4,
    "title": "Sweat Femme Tate",
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
    "isBookmarked": false,
  },
  {
    "id": 5,
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
