import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/AppDetails/SubScreens/privacy_policy.dart';
import 'package:sample/screens/AppDetails/SubScreens/terms_of_use.dart';
import 'package:sample/screens/AppDetails/SubScreens/user_agreement.dart';
import 'package:sample/screens/AppDetails/app_details_screen.dart';

// UI Screens
import 'package:sample/screens/Auth/LoginPage/login_screen.dart';
import 'package:sample/screens/Auth/RegisterPage/register_screen.dart';
import 'package:sample/screens/CompleteProfile/LocationDetails/location_details_screen.dart';
import 'package:sample/screens/CompleteProfile/ProfileDetails/personal_details_screen.dart';
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
          // Welcome
          GetPage(name: "/intro", page: () => const WelcomePage()),

          // Country selection
          GetPage(name: "/country", page: () => const SelectCountry()),

          // Auth --> Login/Register
          GetPage(name: "/auth/login", page: () => const LoginPage()),
          GetPage(name: "/auth/register", page: () => const RegisterScreen()),

          // Support
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

          // More details
          GetPage(name: "/details", page: () => const AppDetailsScreen()),
          GetPage(name: "/details/terms", page: () => const TermsOfUse()),
          GetPage(name: "/details/privacy", page: () => const PrivacyPolicy()),
          GetPage(
              name: "/details/agreement", page: () => const UserAgreement()),

          // Complete profile
          GetPage(
              name: "/complete/profile/personal",
              page: () => const PersonalDetailsScreen()),
          GetPage(
              name: "/complete/profile/location",
              page: () => const LocationDetailsScreen()),

          // Home
          GetPage(name: "/home", page: () => const HomeScreen()),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Aware',
        initialRoute: "/auth/register",
      ),
      // Setting the design size
      designSize: const Size(412, 915),
    );
  }
}
