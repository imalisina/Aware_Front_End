import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/screens/Welcome%20Page/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, Widget? child) => GetCupertinoApp(
        getPages: [
          GetPage(name: "/", page: () => const WelcomePage()),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Aware',
        initialRoute: "/",
      ),
      designSize: const Size(412, 915),
    );
  }
}
