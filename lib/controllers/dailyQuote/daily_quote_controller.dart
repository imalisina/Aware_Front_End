import 'package:get/get.dart';

class DailyQuoteController extends GetxController {
  // Define variable to store generated daily quote
  var dailyQuoteTitle = "";
  var dailyQuote = "";
  var dailyQuoteAuthor = "";
  // Define variable to get user's reaction/feelings
  var userSatisfaction = 0.obs;
  // Define variable to check the availability of daily quotes
  var isLoading = true.obs;

  // Method to generate daily quotes
  void generateDailyQuote() {
    dailyQuoteTitle = "Your Chance !";
    dailyQuote = "Everyday is a chance for you to change your world.";
    dailyQuoteAuthor = "Adolf Hitler";
    toggleIsLoading();
  }

  // Method to toggle between isLoading status
  void toggleIsLoading() {
    isLoading.value = false;
  }

  // DAILY QUOTE FEEDBACK SECTION
  // Define a variable to store the feedback
  var feedbackID = 4.obs;
  // Define static list of feedback emoji names
  List<String> emojiNames = <String>["boring", "useful", "amazing"];
  // Define a variable to check whether an emoji is selected or not
  var isSelected = false.obs;
  // Define a variable as disable attribute for buttons
  var disabledButton = false.obs;

  // Method to store the selected feedback
  void storeFeedbackID(int selectedEmoji) {
    feedbackID.value = selectedEmoji;
    isSelected.value = true;
    disabledButton.value = true;
  }
}
