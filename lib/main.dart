import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/ui/screens/card_screen.dart';
import 'package:flutter_apple_shop/ui/screens/category_screen.dart';
import 'package:flutter_apple_shop/ui/screens/home_screen.dart';
import 'package:flutter_apple_shop/ui/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: selectedBottomNavigationIndex,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: BottomNavigationBar(
                onTap: (index) {
                  setState(() {
                    selectedBottomNavigationIndex = index;
                  });
                },
                currentIndex: selectedBottomNavigationIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedLabelStyle: const TextStyle(
                    fontFamily: 'SB', fontSize: 10, color: ColorsApp.mainBlue),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: 'SB', fontSize: 10, color: Colors.black),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(Assets.iconHome),
                    activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorsApp.mainBlue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          ),
                        ],
                      ),
                      child: Image.asset(Assets.iconHomeActive),
                    ),
                    label: 'خانه',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(Assets.iconCategory),
                    activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorsApp.mainBlue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          ),
                        ],
                      ),
                      child: Image.asset(Assets.iconCategoryActive),
                    ),
                    label: 'دسته بندی',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(Assets.iconBasket),
                    activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorsApp.mainBlue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          ),
                        ],
                      ),
                      child: Image.asset(Assets.iconBasketActive),
                    ),
                    label: 'سبد خرید',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(Assets.iconProfile),
                    activeIcon: Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorsApp.mainBlue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0, 13),
                          ),
                        ],
                      ),
                      child: Image.asset(Assets.iconProfileActive),
                    ),
                    label: 'پروفایل',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreens() {
    return [
      const HomeScreen(),
      const CategoryScreen(),
      const CardScreen(),
      const ProfileScreen(),
    ];
  }
}
