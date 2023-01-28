import 'package:flutter/cupertino.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_without_back_button.dart';
import 'package:sample/components/countrySelection/country_selection_content.dart';

// Country selection page container
class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithoutBackButton,
        child: const CountrySelectionContent(),
      ),
    );
  }
}
