import 'package:flutter/cupertino.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/places/places_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/models/places.dart';
import 'package:sample/packages/flush_bar_method.dart';

class DeletePlaceDialog extends StatelessWidget {
  // Define a variable to store the state values
  final int placeId;
  // Getting props from relations_list.dart
  // ignore: use_key_in_widget_constructors
  const DeletePlaceDialog({required this.placeId});

  // Define places controller
  static final placesController = Get.put(PlacesController());

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      // ignore: unnecessary_string_interpolations
      title: Text("Remove ${Places().places[placeId].placeName}"),
      content: Text(
          "Do you want to remove ${Places().places[placeId].placeName} from your places ?"),
      actions: [
        // Confirm button
        CupertinoDialogAction(
          onPressed: () {
            placesController.deletePlace(placeId);
            Navigator.pop(context);
            showSnackBar(context,
                "The place has been successfully removed from your places list !");
          },
          child: const Text("Yes"),
        ),

        // Deny button
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "No",
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
      ],
    );
  }
}
