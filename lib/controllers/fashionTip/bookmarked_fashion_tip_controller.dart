import 'package:get/get.dart';
import 'package:sample/models/bookmarked_tips.dart';

class BookmarkedFashionTipController extends GetxController {
  // Store selected fashion tip's index
  var selectedFashionTipIndex = 0.obs;
  // Store attributes of selected fashion tip
  var fashionTipTitle = "";
  var fashionTipContent = "";
  var fashionTipLikes = 0.obs;
  var isBookmarked = true.obs;
  var fashionTipImageUrl = "";
  var fashionTipSource = "";
  var fashionTipPublishDate = "";
  var fashionTipPublishTime = "";
  var isLiked = false.obs;

  // Method to change fashion tip like count
  void toggleLikes() {
    isLiked.value = !isLiked.value;
    if (isLiked.isFalse) {
      fashionTipLikes.value--;
    } else {
      fashionTipLikes.value++;
    }
  }

  // Method to toggle the bookmark status
  void toggleBookmark() {
    isBookmarked.value = !isBookmarked.value;
  }

  // Store selected fashion tip
  void storeSelectedFashionTip(int tipIndex) {
    selectedFashionTipIndex.value = tipIndex;
    storeSelectedFashionTipDetails();
  }

  // Extract selected fashion tip details
  void storeSelectedFashionTipDetails() {
    BookmarkedTip selectedFashionTip =
        BookmarkedTip.fromJSON(data[selectedFashionTipIndex.value]);
    fashionTipTitle = selectedFashionTip.title;
    fashionTipContent = selectedFashionTip.content;
    fashionTipLikes.value = selectedFashionTip.likes;
    isLiked.value = selectedFashionTip.isLiked;
    isBookmarked.value = selectedFashionTip.isBookmarked;
    fashionTipImageUrl = selectedFashionTip.tipImage;
    fashionTipSource = selectedFashionTip.tipSource;
    fashionTipPublishDate = selectedFashionTip.publishDate;
    fashionTipPublishTime = selectedFashionTip.publishTime;
  }
}
