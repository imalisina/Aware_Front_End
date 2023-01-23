import 'package:get/get.dart';

// UI screens
import 'package:sample/screens/appDetails/app_details_screen.dart';
import 'package:sample/screens/appDetails/subScreens/privacy_policy.dart';
import 'package:sample/screens/appDetails/subScreens/terms_of_use.dart';
import 'package:sample/screens/appDetails/subScreens/user_agreement.dart';
import 'package:sample/screens/auth/login/login_screen.dart';
import 'package:sample/screens/auth/register/register_screen.dart';
import 'package:sample/screens/completeProfile/LocationDetails/location_details_screen.dart';
import 'package:sample/screens/completeProfile/confirmation/profile_confirmation_screen.dart';
import 'package:sample/screens/completeProfile/personalDetails/personal_details_screen.dart';
import 'package:sample/screens/countrySelection/select_country_screen.dart';
import 'package:sample/screens/shop/singleProduct/single_product_screen.dart';
import 'package:sample/screens/support/contactUs/contact_us_screen.dart';
import 'package:sample/screens/support/passwordRecovery/emailMethod/email_method.dart';
import 'package:sample/screens/support/passwordRecovery/emailVerification/email_verification.dart';
import 'package:sample/screens/support/passwordRecovery/password_recovery_screen.dart';
import 'package:sample/screens/support/passwordRecovery/resetPassword/reset_password_screen.dart';
import 'package:sample/screens/support/passwordRecovery/secureCodeMethod/secure_code_method.dart';
import 'package:sample/screens/support/support_screen.dart';
import 'package:sample/screens/welcome/welcome_screen.dart';
import 'package:sample/screens/home/home_screen.dart';

class RoutesClass {
  // Define a getter for initial route
  static String getHomePage() => "/home";

  // Define all routes of the application
  static List<GetPage> routes = [
    // Welcome
    GetPage(name: "/intro", page: () => const WelcomePage()),

    // Country selection
    GetPage(name: "/country", page: () => const SelectCountry()),

    // Auth --> Login/Register
    GetPage(name: "/auth/login", page: () => const LoginPage()),
    GetPage(name: "/auth/register", page: () => const RegisterScreen()),

    // Support
    GetPage(name: "/support/menu", page: () => const SupportScreen()),
    GetPage(name: "/support/contact", page: () => const ContactUsScreen()),
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
    GetPage(name: "/details/agreement", page: () => const UserAgreement()),

    // Complete profile
    GetPage(
        name: "/complete/profile/personal",
        page: () => const PersonalDetailsScreen()),
    GetPage(
        name: "/complete/profile/location",
        page: () => const LocationDetailsScreen()),

    GetPage(
        name: "/complete/profile/confirmation",
        page: () => const ProfileConfirmationScreen()),

    // Home
    GetPage(name: "/home", page: () => const HomeScreen()),
    // Shop & Products
    GetPage(
        name: "/shop/products/single", page: () => const SingleProductScreen())
  ];
}
