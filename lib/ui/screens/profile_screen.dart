import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/ui/widgets/category_horizontal_item_chip.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 32),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(Assets.imagesIconAppleBlue),
                      ),
                      const Expanded(
                        child: Text(
                          "حساب کاربری",
                          style: TextStyle(
                            fontFamily: 'SM',
                            fontSize: 16,
                            color: ColorsApp.mainBlue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              "علیرضا باشی",
              style: TextStyle(fontFamily: 'SB', fontSize: 16),
            ),
            const Text(
              "09187477703",
              style: TextStyle(fontFamily: 'SM', fontSize: 10),
            ),
            const SizedBox(height: 30),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: const [
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                  CategoryHorizontalItemChip(),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              "Apple Shop",
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: ColorsApp.mainGrey,
              ),
            ),
            const Text(
              "v-1.0.00",
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: ColorsApp.mainGrey,
              ),
            ),
            const Text(
              "Instagram.com/alirezabashi98",
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: ColorsApp.mainGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
