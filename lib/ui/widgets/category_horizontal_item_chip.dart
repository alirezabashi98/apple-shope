import 'package:flutter/material.dart';

class CategoryHorizontalItemChip extends StatelessWidget {
  const CategoryHorizontalItemChip({
    Key? key,
  }) : super(key: key);

// SizedBox(
//             height: 100,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.only(
//                     left: (index == 0) ? 44 : 10,
//                     right: (index == 9) ? 44 : 10,
//                   ),
//                   child: const CategoryHorizontalItemList(),
//                 );
//               },
//             ),
//           ),

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: ShapeDecoration(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            color: Colors.amber,
            shadows: const [
              BoxShadow(
                color: Colors.amber,
                blurRadius: 21,
                spreadRadius: -9,
                offset: Offset(0.0, 10),
              ),
            ],
          ),
          child: const Icon(
            Icons.mouse,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "همه",
          style: TextStyle(
            fontFamily: 'SB',
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
