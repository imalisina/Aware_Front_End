import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/app/app_container.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Wrap with responsive widget
    return ScreenUtilInit(
      builder: (context, Widget? child) => GetCupertinoApp(
        theme: const CupertinoThemeData(
            brightness: Brightness.light, primaryColor: MAIN_COLOR),
        // Specify the routes in the application
        getPages: RoutesClass.routes,
        debugShowCheckedModeBanner: false,
        title: 'Aware',
        // initialRoute: RoutesClass.getHomePage(), 
        home: const AppContainer(),
      ),
      // Setting the design size
      designSize: const Size(412, 915),
    );
  }
}
