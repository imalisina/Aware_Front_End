import 'package:get/get.dart';

class ContestAwardsController extends GetxController {
  // Define a variable to store number of winners
  final int winnerCount = 3;

  // Define a variable to store first winner award details
  final List<String> firstWinnerAwards = <String>[
    "USD \$20,000 cash",
    "Best Of Aware prize",
    "a valid certificate from contest Jury",
  ];

  // Define a variable to store second winner award details
  final List<String> secondWinnerAwards = <String>[
    "USD \$5,000 cash",
    "Future Model Of Aware prize",
  ];

  // Define a variable to store third winner award details
  final List<String> thirdWinnerAwards = <String>[
    "AFP (Aware Fashion Pack) Gift",
  ];
}
