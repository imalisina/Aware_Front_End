import 'package:flutter/cupertino.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/relations/relations_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/models/relations.dart';
import 'package:sample/packages/flush_bar_method.dart';

class DeleteRelationDialog extends StatelessWidget {
  // Define a variable to store the state values
  final int relationId;
  // Getting props from relations_list.dart
  // ignore: use_key_in_widget_constructors
  const DeleteRelationDialog({required this.relationId});

  // Define relations controller
  static final relationsController = Get.put(RelationsController());

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      // ignore: unnecessary_string_interpolations
      title: Text("Remove ${Relations().relations[relationId].name}"),
      content: Text(
          "Do you want to remove ${Relations().relations[relationId].name} from your relations ?"),
      actions: [
        // Confirm button
        CupertinoDialogAction(
          onPressed: () {
            relationsController.deleteRelation(relationId);
            Navigator.pop(context);
            showSnackBar(context,
                "The person has been successfully removed from your relations list !");
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
