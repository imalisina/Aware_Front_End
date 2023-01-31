import 'package:flutter/cupertino.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/accessories/accessories_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/models/accessories.dart';
import 'package:sample/packages/flush_bar_method.dart';

class DeleteAccessoryDialog extends StatelessWidget {
  // Define a variable to store the state values
  final int accessoryId;
  // Getting props from accessories_list.dart
  // ignore: use_key_in_widget_constructors
  const DeleteAccessoryDialog({required this.accessoryId});

  // Define accessories controller
  static final accessoriesController = Get.put(AccessoriesController());

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("Remove ${Accessories().accessories[accessoryId].name}"),
      content: Text(
          "Do you want to remove ${Accessories().accessories[accessoryId].name} from your accessories ?"),
      actions: [
        // Confirm button
        CupertinoDialogAction(
          onPressed: () {
            accessoriesController.deleteAccessory(accessoryId);
            Navigator.pop(context);
            showSnackBar(context,
                "The accessory has been successfully removed from your collections !");
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
