import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/category/category_bloc.dart';
import 'package:flutter_apple_shop/bloc/home/home_bloc.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/data/model/basket_model.dart';
import 'package:flutter_apple_shop/data/repository/banner_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/ui/page/card_page.dart';
import 'package:flutter_apple_shop/ui/screens/category_screen.dart';
import 'package:flutter_apple_shop/ui/screens/home_screen.dart';
import 'package:flutter_apple_shop/ui/screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // di
  await getItInit();
  // database hive
  await Hive.initFlutter();
  Hive.registerAdapter(BasketModelAdapter());
  await Hive.openBox<BasketModel>('BasketBox');
  // run ui
  runApp(const MyApp());
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async{

              var response = await BannerRepository().getBanners();
              // ignore: avoid_print
              response.fold((l) => print(l), (r) => print(r[0].thumbnail));

            },
            child: const Text("on click"),
          ),
        ),
      ),
    );
  }
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
                    icon: Image.asset(Assets.imagesIconHome),
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
                      child: Image.asset(Assets.imagesIconHomeActive),
                    ),
                    label: 'خانه',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(Assets.imagesIconCategory),
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
                      child: Image.asset(Assets.imagesIconCategoryActive),
                    ),
                    label: 'دسته بندی',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(Assets.imagesIconBasket),
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
                      child: Image.asset(Assets.imagesIconBasketActive),
                    ),
                    label: 'سبد خرید',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(Assets.imagesIconProfile),
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
                      child: Image.asset(Assets.imagesIconProfileActive),
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
      Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
          child: const HomeScreen(),
        ),
      ),
      BlocProvider<CategoryBloc>(
        create: (context) => CategoryBloc(),
        child: const CategoryScreen(),
      ),
      const CardPage(),
      const ProfileScreen(),
    ];
  }
}
