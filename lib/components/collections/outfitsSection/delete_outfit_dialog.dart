import 'package:flutter/cupertino.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/outfits/outfits_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/models/outfits.dart';
import 'package:sample/packages/flush_bar_method.dart';

class DeleteOutfitDialog extends StatelessWidget {
  // Define a variable to store the state values
  final int outfitId;
  // Getting props from accessories_list.dart
  // ignore: use_key_in_widget_constructors
  const DeleteOutfitDialog({required this.outfitId});

  // Define outfits controller
  static final outfitsController = Get.put(OutfitsController());

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Remove ${Outfits().outfits[outfitId].name}"),
      content: Text(
          "Do you want to remove ${Outfits().outfits[outfitId].name} from your outfits ?"),
      actions: [
        // Confirm button
        CupertinoDialogAction(
          onPressed: () {
            outfitsController.deleteOutfit(outfitId);
            Navigator.pop(context);
            showSnackBar(context,
                "The outfit has been successfully removed from your collections !");
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
