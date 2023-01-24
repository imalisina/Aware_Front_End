import 'package:get/get.dart';
import 'package:sample/app/app_container.dart';
import 'package:sample/configs/route_names.dart';

// UI screens
import 'package:sample/screens/appDetails/app_details_screen.dart';
import 'package:sample/screens/appDetails/subScreens/privacy_policy.dart';
import 'package:sample/screens/appDetails/subScreens/terms_of_use.dart';
import 'package:sample/screens/appDetails/subScreens/user_agreement.dart';
import 'package:sample/screens/auth/login/login_screen.dart';
import 'package:sample/screens/auth/register/register_screen.dart';
import 'package:sample/screens/bookmarks/bookmarkedProducts/single_bookmarked_product_screen.dart';
import 'package:sample/screens/bookmarks/bookmarkedTips/bookmarked_tips_screen.dart';
import 'package:sample/screens/bookmarks/bookmarkedTips/single_bookmarked_tip_screen.dart';
import 'package:sample/screens/bookmarks/bookmarks_screen.dart';
import 'package:sample/screens/completeProfile/LocationDetails/location_details_screen.dart';
import 'package:sample/screens/completeProfile/confirmation/profile_confirmation_screen.dart';
import 'package:sample/screens/completeProfile/personalDetails/personal_details_screen.dart';
import 'package:sample/screens/countrySelection/select_country_screen.dart';
import 'package:sample/screens/fashionTips/singleTip/single_fashion_tip_screen.dart';
import 'package:sample/screens/shop/singleProduct/single_product_screen.dart';
import 'package:sample/screens/support/contactUs/contact_us_screen.dart';
import 'package:sample/screens/support/passwordRecovery/emailMethod/email_method.dart';
import 'package:sample/screens/support/passwordRecovery/emailVerification/email_verification.dart';
import 'package:sample/screens/support/passwordRecovery/password_recovery_screen.dart';
import 'package:sample/screens/support/passwordRecovery/resetPassword/reset_password_screen.dart';
import 'package:sample/screens/support/passwordRecovery/secureCodeMethod/secure_code_method.dart';
import 'package:sample/screens/support/support_screen.dart';
import 'package:sample/screens/welcome/welcome_screen.dart';
import 'package:sample/screens/bookmarks/bookmarkedProducts/bookmarked_products_screen.dart';

class RoutesClass {
  // Define all routes of the application
  static List<GetPage> routes = [
    // Welcome
    GetPage(name: introduction, page: () => const WelcomePage()),

    // Country selection
    GetPage(name: countrySelection, page: () => const SelectCountry()),

    // Auth --> Login/Register
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: register, page: () => const RegisterScreen()),

    // Support
    GetPage(name: supportMenu, page: () => const SupportScreen()),
    GetPage(name: contactUs, page: () => const ContactUsScreen()),
    GetPage(name: passwordRecovery, page: () => const PasswordRecoveryScreen()),
    GetPage(name: secureCode, page: () => const SecureCodeMethod()),
    GetPage(name: emailMethod, page: () => const EmailMethod()),
    GetPage(name: emailVerification, page: () => const EmailVerification()),
    GetPage(name: resetPassword, page: () => const ResetPasswordScreen()),

    // More details
    GetPage(name: details, page: () => const AppDetailsScreen()),
    GetPage(name: terms, page: () => const TermsOfUse()),
    GetPage(name: privacy, page: () => const PrivacyPolicy()),
    GetPage(name: agreement, page: () => const UserAgreement()),

    // Complete profile
    GetPage(name: personalDetails, page: () => const PersonalDetailsScreen()),
    GetPage(name: locationDetails, page: () => const LocationDetailsScreen()),

    GetPage(name: confirmation, page: () => const ProfileConfirmationScreen()),

    // Home
    GetPage(name: home, page: () => const AppContainer()),

    // Shop & Products
    GetPage(name: singleProduct, page: () => const SingleProductScreen()),

    // Fashion tips
    GetPage(name: singleFashionTip, page: () => const SingleFashionTipScreen()),

    // Bookmarks
    GetPage(name: bookmarksMenu, page: () => const BookmarksScreen()),
    GetPage(
        name: bookmarkedProducts, page: () => const BookmarkedProductsScreen()),
    GetPage(
        name: singleBookmarkedProduct,
        page: () => const SingleBookmarkedProductScreen()),
    GetPage(name: bookmarkedTips, page: () => const BookmarkedTipsScreen()),
    GetPage(
        name: singleBookmarkedTip,
        page: () => const SingleBookmarkedTipScreen()),
  ];
}
