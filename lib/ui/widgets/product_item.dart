import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/constants/constants.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
          Stack(
            alignment: Alignment.center,
            children: [
              Expanded(child: Container()),
              Image.asset("assets/images/iphone.png"),
              Positioned(
                right: 10,
                top: 0,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                      "assets/images/active_fav_product.png"),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    child: Text(
                      "3%",
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12,bottom: 10),
            child: Text(
              "آیفون ۱۳ پرو مکس",
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: ColorsApp.mainBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.mainBlue,
                    blurRadius: 14,
                    spreadRadius: -12,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      "تومان",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'SM',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "49,800,000",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                            fontFamily: 'SM',
                          ),
                        ),
                        Text(
                          "49,800,000",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SM',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                          "assets/images/icon_right_arrow_cricle.png"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
