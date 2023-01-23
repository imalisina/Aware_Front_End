import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/screens/home/home_screen.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final List<Widget> pageTabs = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: BACKGROUND_COLOR,
        automaticallyImplyLeading: disableBackButton,
        border: navigationBorder,
        padding: EdgeInsetsDirectional.only(top: 9.h),
        middle: Text(
          titleText,
          style: GoogleFonts.pacifico(
              color: MAIN_COLOR,
              fontSize: titleFontSize,
              fontWeight: titleFontWeight),
        ),
      ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.add), label: "Add1"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.add_circled), label: "Add2"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.add_circled_solid), label: "Add3"),
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return pageTabs[index];
          },
        ),
    );
  }
}
