import 'package:get/get.dart';
import 'package:sample/app/app_container.dart';
import 'package:sample/configs/route_names.dart';

// UI screens
import 'package:sample/screens/appDetails/app_details_screen.dart';
import 'package:sample/screens/appDetails/subScreens/privacy_policy_screen.dart';
import 'package:sample/screens/appDetails/subScreens/terms_of_use_screen.dart';
import 'package:sample/screens/appDetails/subScreens/user_agreement_screen.dart';
import 'package:sample/screens/auth/login_screen.dart';
import 'package:sample/screens/auth/register_screen.dart';
import 'package:sample/screens/bookmarks/bookmarkedProducts/single_bookmarked_product_screen.dart';
import 'package:sample/screens/bookmarks/bookmarkedTips/bookmarked_tips_screen.dart';
import 'package:sample/screens/bookmarks/bookmarkedTips/single_bookmarked_tip_screen.dart';
import 'package:sample/screens/bookmarks/bookmarks_screen.dart';
import 'package:sample/screens/completeProfile/LocationDetails/location_details_screen.dart';
import 'package:sample/screens/completeProfile/profile_confirmation_screen.dart';
import 'package:sample/screens/completeProfile/personal_details_screen.dart';
import 'package:sample/screens/countrySelection/select_country_screen.dart';
import 'package:sample/screens/fashionTips/single_fashion_tip_screen.dart';
import 'package:sample/screens/settings/menuScreens/getSecureCode/get_secure_code_screen.dart';
import 'package:sample/screens/settings/menuScreens/locationSettings/location_settings_screen.dart';
import 'package:sample/screens/settings/menuScreens/resetDiaryPassword/reset_diary_password_screen.dart';
import 'package:sample/screens/settings/settings_screen.dart';
import 'package:sample/screens/shop/all_products_screen.dart';
import 'package:sample/screens/shop/singleSuggestedProduct/single_suggested_product_screen.dart';
import 'package:sample/screens/shop/single_product_screen.dart';
import 'package:sample/screens/support/contactUs/contact_us_screen.dart';
import 'package:sample/screens/support/passwordRecovery/emailMethod/email_method_screen.dart';
import 'package:sample/screens/support/passwordRecovery/emailVerification/email_verification_screen.dart';
import 'package:sample/screens/support/passwordRecovery/password_recovery_screen.dart';
import 'package:sample/screens/support/passwordRecovery/resetPassword/reset_password_screen.dart';
import 'package:sample/screens/support/passwordRecovery/secureCodeMethod/secure_code_method_screen.dart';
import 'package:sample/screens/support/support_screen.dart';
import 'package:sample/screens/welcome/welcome_screen.dart';
import 'package:sample/screens/bookmarks/bookmarkedProducts/bookmarked_products_screen.dart';

class RoutesClass {
  // Define all routes of the application
  static List<GetPage> routes = [
    // Welcome
    GetPage(name: introduction, page: () => const WelcomeScreen()),

    // Country selection
    GetPage(name: countrySelection, page: () => const SelectCountryScreen()),

    // Auth --> Login/Register
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),

    // Support
    GetPage(name: supportMenu, page: () => const SupportScreen()),
    GetPage(name: contactUs, page: () => const ContactUsScreen()),
    GetPage(name: passwordRecovery, page: () => const PasswordRecoveryScreen()),
    GetPage(name: secureCode, page: () => const SecureCodeMethodScreen()),
    GetPage(name: emailMethod, page: () => const EmailMethodScreen()),
    GetPage(name: emailVerification, page: () => const EmailVerificationScreen()),
    GetPage(name: resetPassword, page: () => const ResetPasswordScreen()),

    // More details
    GetPage(name: details, page: () => const AppDetailsScreen()),
    GetPage(name: terms, page: () => const TermsOfUseScreen()),
    GetPage(name: privacy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: agreement, page: () => const UserAgreementScreen()),

    // Complete profile
    GetPage(name: personalDetails, page: () => const PersonalDetailsScreen()),
    GetPage(name: locationDetails, page: () => const LocationDetailsScreen()),

    GetPage(name: confirmation, page: () => const ProfileConfirmationScreen()),

    // Home
    GetPage(name: home, page: () => const AppContainer()),

    // Shop & Products
    GetPage(name: allProducts, page: () => const AllProductsScreen()),
    GetPage(name: singleProduct, page: () => const SingleProductScreen()),
    GetPage(
        name: singleSuggestedProduct,
        page: () => const SingleSuggestedProductScreen()),

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

    // Settings
    GetPage(name: settings, page: () => const SettingsScreen()),
    GetPage(name: getSecureCode, page: () => const GetSecureCodeScreen()),
    GetPage(
        name: resetDiaryPassword, page: () => const ResetDiaryPasswordScreen()),
    GetPage(name: locationSettings, page: () => const LocationSettingsScreen()),
  ];
}
