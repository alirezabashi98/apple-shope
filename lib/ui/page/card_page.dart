import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_bloc.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_event.dart';
import 'package:flutter_apple_shop/ui/screens/card_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          var bloc = BasketBloc();
          bloc.add(BasketFetchFromHiveEvent());
          return bloc;
        },
        child: const CardScreen(),
      ),
    );
  }
}
