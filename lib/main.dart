import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/screens/WelcomePage/welcome_screen.dart';

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
        // Specify the routes in the application
        getPages: [
          GetPage(name: "/", page: () => const WelcomePage()),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Aware',
        initialRoute: "/",
      ),
      // Setting the design size
      designSize: const Size(412, 915),
    );
  }
}
