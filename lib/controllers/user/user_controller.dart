import 'package:get/get.dart';
import 'package:sample/models/user.dart';

class UserController extends GetxController {
  // Define new instance of user
  late User appUser;

  // Define a variable to store number of days left for user's birthday
  var daysLeft = 0;
  // Method to calculate days left
  void daysLeftForBirthday() {
    DateTime now = DateTime.now();
    int currentDay = now.day;
    int currentMonth = now.month;
    var numberOfMonths = ((currentMonth - appUser.birthMonth).abs() * 30);
    daysLeft = ((appUser.birthDay - currentDay) + numberOfMonths).abs();
  }

  // Initialize new user
  @override
  void onInit() {
    appUser = User();
    daysLeftForBirthday();
    super.onInit();
  }
}
