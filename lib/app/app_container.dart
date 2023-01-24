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
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
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
            backgroundColor: BACKGROUND_COLOR,
            border: Border.all(color: GHOST_COLOR),
            inactiveColor: INPUT_PLACEHOLDER,
            height: 60.h,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.house),
                label: "Home",
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.collections),
                label: "Collections",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.add_circled, size: 45.sp),
                activeIcon: Icon(CupertinoIcons.add_circled_solid, size: 45.sp),
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.pencil_outline),
                label: "Diary",
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.gear_big),
                label: "Settings",
              ),
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return pageTabs[index];
          },
        ),
      ),
    );
  }
}