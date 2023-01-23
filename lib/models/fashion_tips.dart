class FashionTips {
  List<FashionTip> fashionTips = getFashionTips();
  static List<FashionTip> getFashionTips() {
    return data.map<FashionTip>(FashionTip.fromJSON).toList();
  }
}

class FashionTip {
  final String title, content, publishDate, publishTime, tipImage, tipSource;
  final int likes;
  final bool isBookmarked;

  const FashionTip(
      {required this.title,
      required this.content,
      required this.likes,
      required this.isBookmarked,
      required this.publishDate,
      required this.publishTime,
      required this.tipImage,
      required this.tipSource});

  static FashionTip fromJSON(json) => FashionTip(
      title: json["title"],
      content: json["content"],
      likes: json["likes"],
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
    "publish_date": "16 Aug 2022",
    "publish_time": "01:33 A.M",
    "tip_image":
        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/shutterstock-editorial-13014271af-1674040587.jpg?crop=0.669xw:1.00xh;0.0862xw,0&resize=980:*",
    "tip_source": "https://www.elle.com"
  },
  {
    "title": "How to find a good color schema for outfit combination ?",
    "content":
        "When your hair is healthy then you are just going to have an overall more beautiful look. So try and cut back on the heat tools and get a great conditioner for your hair. I big lesson that I have learned is that when I don’t always dye or bleach my hair it starts to look so much prettier and healthy. Let it grow out natural for awhile you just might be surprised at how pretty it looks.",
    "likes": 538,
    "isBookmarked": true,
    "publish_date": "08 Dec 2019",
    "publish_time": "19:45 P.M",
    "tip_image":
        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1175081734.jpg?crop=0.668xw:1.00xh;0.180xw,0&resize=980:*",
    "tip_source": "https://www.harpersbazaar.com"
  },
];
