import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/constants/constants.dart';

// UI Screens
import 'package:sample/screens/Auth/LoginPage/login_screen.dart';
import 'package:sample/screens/Auth/RegisterPage/register_screen.dart';
import 'package:sample/screens/CountrySelection/select_country_screen.dart';
import 'package:sample/screens/HomePage/home_screen.dart';
import 'package:sample/screens/SupportPage/ContactUsPage/contact_us_screen.dart';
import 'package:sample/screens/SupportPage/PasswordRecovery/EmailMethod/email_method.dart';
import 'package:sample/screens/SupportPage/PasswordRecovery/EmailVerificationPage/email_verification.dart';
import 'package:sample/screens/SupportPage/PasswordRecovery/ResetPasswordPage/reset_password_screen.dart';
import 'package:sample/screens/SupportPage/PasswordRecovery/SecureCodeMethod/secure_code_method.dart';
import 'package:sample/screens/SupportPage/PasswordRecovery/password_recovery_screen.dart';
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
          GetPage(
              name: "/support/password/recovery",
              page: () => const PasswordRecoveryScreen()),
          GetPage(
              name: "/support/password/recovery/secure_code",
              page: () => const SecureCodeMethod()),
          GetPage(
              name: "/support/password/recovery/email",
              page: () => const EmailMethod()),
          GetPage(
              name: "/support/password/recovery/email/verification",
              page: () => const EmailVerification()),
          GetPage(
              name: "/support/password/reset",
              page: () => const ResetPasswordScreen()),
          GetPage(name: "/home", page: () => const HomeScreen()),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Aware',
        initialRoute: "/support/password/recovery/email/verification",
      ),
      // Setting the design size
      designSize: const Size(412, 915),
    );
  }
}
