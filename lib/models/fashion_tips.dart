class FashionTips {
  List<FashionTip> fashionTips = getFashionTips();
  static List<FashionTip> getFashionTips() {
    return data.map<FashionTip>(FashionTip.fromJSON).toList();
  }
}

class FashionTip {
  final String title, content, publishDate, publishTime, tipImage, tipSource;
  final int likes;
  final bool isBookmarked, isLiked;

  const FashionTip(
      {required this.title,
      required this.content,
      required this.likes,
      required this.isLiked,
      required this.isBookmarked,
      required this.publishDate,
      required this.publishTime,
      required this.tipImage,
      required this.tipSource});

  static FashionTip fromJSON(json) => FashionTip(
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

// Fashion Tips JSON data
const data = [
  {
    "title": "10 Tips to look elegant !",
    "content":
        "Women that are naturally beautiful know how important it is to moisturize their skin. You will want to find a great moisturizer and make sure that you apply it at least once a day. Make it your new habit that after you get out of the shower you apply your moisturizer. You will keep your skin soft and pretty.",
    "likes": 120,
    "isBookmarked": false,
    "isLiked": false,
    "publish_date": "16 Aug 2022",
    "publish_time": "01:33 A.M",
    "tip_image":
        "https://media.gettyimages.com/id/1179747953/photo/our-style-is-influenced-by-our-upbringing.jpg?s=1024x1024&w=gi&k=20&c=pfaLU5pkO6bPHpy6nTQNDnqEO-7aRCmmzgG71owPqEQ=",
    "tip_source": "https://www.elle.com"
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
];
