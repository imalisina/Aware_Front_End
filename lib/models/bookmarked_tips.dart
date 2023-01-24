class BookmarkedTips {
  List<BookmarkedTip> bookmarkedTips = getBookmarkedTips();
  static List<BookmarkedTip> getBookmarkedTips() {
    return data.map<BookmarkedTip>(BookmarkedTip.fromJSON).toList();
  }
}

class BookmarkedTip {
  final String title, content, publishDate, publishTime, tipImage, tipSource;
  final int likes;
  final bool isBookmarked, isLiked;

  const BookmarkedTip(
      {required this.title,
      required this.content,
      required this.likes,
      required this.isLiked,
      required this.isBookmarked,
      required this.publishDate,
      required this.publishTime,
      required this.tipImage,
      required this.tipSource});

  static BookmarkedTip fromJSON(json) => BookmarkedTip(
      title: json["title"],
      content: json["content"],
      likes: json["likes"],
      isLiked: json["isLiked"],
      isBookmarked: json["isBookmarked"],
      publishDate: json["publish_date"],
      publishTime: json["publish_time"],
      tipImage: json["tip_image"],
      tipSource: json["tip_source"]);
}

// Bookmarked fashion tips JSON data
const data = [
  {
    "title": "29 color that match with every attire !",
    "content":
        "When your hair is healthy then you are just going to have an overall more beautiful look. So try and cut back on the heat tools and get a great conditioner for your hair. I big lesson that I have learned is that when I don’t always dye or bleach my hair it starts to look so much prettier and healthy. Let it grow out natural for awhile you just might be surprised at how pretty it looks.",
    "likes": 811,
    "isBookmarked": true,
    "isLiked": false,
    "publish_date": "08 Dec 2019",
    "publish_time": "19:45 P.M",
    "tip_image":
        "https://media.gettyimages.com/id/1129434176/photo/amazing-young-woman-posing-in-apricot-tree-orchard-at-spring.jpg?s=1024x1024&w=gi&k=20&c=PvbPplR81lfLz9b7wNcO56xEa7F3wHlo2cuCIHrbuLE=",
    "tip_source": "https://www.harpersbazaar.com"
  },
  {
    "title": "How to find a good color schema for outfit combination ?",
    "content":
        "When your hair is healthy then you are just going to have an overall more beautiful look. So try and cut back on the heat tools and get a great conditioner for your hair. I big lesson that I have learned is that when I don’t always dye or bleach my hair it starts to look so much prettier and healthy. Let it grow out natural for awhile you just might be surprised at how pretty it looks.",
    "likes": 538,
    "isBookmarked": true,
    "isLiked": false,
    "publish_date": "08 Dec 2019",
    "publish_time": "19:45 P.M",
    "tip_image":
        "https://media.gettyimages.com/id/1306342110/photo/beautiful-woman-with-pink-hair.jpg?s=1024x1024&w=gi&k=20&c=LrgsCQuliUxSCyrdiW0PigMhUagxNOg6ttMLMYcMoLo=",
    "tip_source": "https://www.harpersbazaar.com"
  },
  {
    "title": "Best tricks to look like a Sigma male !",
    "content":
        "When your hair is healthy then you are just going to have an overall more beautiful look. So try and cut back on the heat tools and get a great conditioner for your hair. I big lesson that I have learned is that when I don’t always dye or bleach my hair it starts to look so much prettier and healthy. Let it grow out natural for awhile you just might be surprised at how pretty it looks.",
    "likes": 306,
    "isBookmarked": true,
    "isLiked": false,
    "publish_date": "08 Dec 2019",
    "publish_time": "19:45 P.M",
    "tip_image":
        "https://media.gettyimages.com/id/707437721/photo/black-man-wearing-sunglasses-adjusting-jacket.jpg?s=1024x1024&w=gi&k=20&c=-x512_0UtcCt_gS2jnVYF-4JSaSQEwlamewlBZCgAQg=",
    "tip_source": "https://www.harpersbazaar.com"
  },
];
