import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/app/app_container.dart';
import 'package:sample/controllers/app/main_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/routes/routes.dart';
import 'package:sample/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Define main controller
  static final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    // Wrap with responsive widget
    return ScreenUtilInit(
      builder: (context, Widget? child) => Obx(
        () => GetCupertinoApp(
          theme: const CupertinoThemeData(
              brightness: Brightness.light, primaryColor: MAIN_COLOR),
          // Specify the routes in the application
          getPages: RoutesClass.routes,
          debugShowCheckedModeBanner: false,
          title: 'Aware',
          // Check whether user is authenticated or not
          home: mainController.isAuthenticated.isFalse
              ? const AppContainer()
              : const WelcomeScreen(),
        ),
      ),
      // Setting the design size
      designSize: const Size(412, 915),
    );
  }
}
