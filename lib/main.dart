import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:instagram/Basic/Constant.dart';
import 'package:instagram/Screen/AddPost_Screen.dart';
import 'package:instagram/Screen/Explore_Screen.dart';
import 'package:instagram/Screen/Home_Screen.dart';
import 'package:instagram/Screen/Profile_Screen.dart';
import 'package:instagram/Screen/UserActivity_Screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor : color1));
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
            elevatedButtonTheme: _getElevatedStyle(),
            textTheme: _get_TextStyle()),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBody: true,
          bottomNavigationBar: _getBottomNavigation(),
          body: _getLayout(),
        ),
      );

  _getElevatedStyle() => ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: color2,
      ));

  _get_TextStyle() => TextTheme(
      headlineLarge: _Style_H3(),
      headlineMedium: _Style_H4(),
      headlineSmall: _Style_H5(),
      titleLarge: _Style_H6(),
      titleMedium: _Style_H7(),
      titleSmall: _Style_H8());

  _Style_H3() => TextStyle(
      color: color4,
      fontSize: 24,
      fontFamily: 'GB',
      fontWeight: FontWeight.w500);

  _Style_H4() => TextStyle(
      color: color4,
      fontSize: 16,
      fontFamily: 'GB',
      fontWeight: FontWeight.w500);

  _Style_H5() => TextStyle(
      color: color4,
      fontSize: 14,
      fontFamily: 'GM',
      fontWeight: FontWeight.w500);

  _Style_H6() => TextStyle(
      color: color4,
      fontSize: 12,
      fontFamily: 'GB',
      fontWeight: FontWeight.w500);

  _Style_H7() => TextStyle(
      color: color4,
      fontSize: 12,
      fontFamily: 'GR',
      fontWeight: FontWeight.w400);

  _Style_H8() => TextStyle(
      color: color4,
      fontSize: 10,
      fontFamily: 'GM',
      fontWeight: FontWeight.w400);

  _getBottomNavigation() => ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15)
    ),
    child: BottomNavigationBar(
            backgroundColor: Color(0xff272b40),
            currentIndex: selected,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedIconTheme: IconThemeData(color: color2),
            onTap: (index) => setState(() {
                  selected = index;
                }),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_home.png'),
                activeIcon: Image.asset('images/group1.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/group2.png'),
                activeIcon: Image.asset('images/icon_search_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/group3.png'),
                activeIcon: Image.asset('images/icon_add_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/group4.png'),
                activeIcon: Image.asset('images/icon_activity_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _getImageBoxStory(30.0, [color3,color3], 'me.jpg', 6.0, false),
                activeIcon: _getImageBoxStory(30.0, [color2,color5], 'me.jpg', 15.0, false),
                label: '',
              ),
            ]),
  );

  _getLayout() => IndexedStack(
    index: selected,
    children: [
      Home_Screen(),
      Explore_Screen(),
      AddPost_Screen(),
      UserActivity_Screen(),
      Profile_Screen()
    ],
  );

  _getImageBoxStory(size, color, image, double radius, bool isPlus) => Padding(
    padding: EdgeInsets.only(right: 16.0),
    child: Container(
      width: isPlus ? size - 4 : size,
      height: isPlus ? size - 4 : size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: GradientBoxBorder(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [color[0], color[1]]),
            width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.all(isPlus ? 4.0 : 0.0),
        child: ClipRRect(
            borderRadius:
            BorderRadius.circular((radius - (radius / 4)).toDouble()),
            child: Image.asset(
              'images/$image',
              fit: isPlus ? BoxFit.none : BoxFit.cover,
            )),
      ),
    ),
  );

}
