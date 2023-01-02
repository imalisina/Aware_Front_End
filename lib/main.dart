import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/constants/constants.dart';

// UI Screens
import 'package:sample/screens/Auth/LoginPage/login_screen.dart';
import 'package:sample/screens/Auth/RegisterPage/register_screen.dart';
import 'package:sample/screens/CountrySelection/select_country_screen.dart';
import 'package:sample/screens/HomePage/home_screen.dart';
import 'package:sample/screens/SupportPage/ContactUsPage/contact_us_screen.dart';
import 'package:sample/screens/SupportPage/support_screen.dart';
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
        theme: const CupertinoThemeData(
            brightness: Brightness.light, primaryColor: MAIN_COLOR),
        // Specify the routes in the application
        getPages: [
          GetPage(name: "/intro", page: () => const WelcomePage()),
          GetPage(name: "/country", page: () => const SelectCountry()),
          GetPage(name: "/auth/login", page: () => const LoginPage()),
          GetPage(name: "/auth/register", page: () => const RegisterScreen()),
          GetPage(name: "/support/menu", page: () => const SupportScreen()),
          GetPage(
              name: "/support/contact", page: () => const ContactUsScreen()),
          GetPage(name: "/home", page: () => const HomeScreen()),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Aware',
        initialRoute: "/auth/login",
      ),
      // Setting the design size
      designSize: const Size(412, 915),
    );
  }
}
