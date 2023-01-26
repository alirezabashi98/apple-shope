import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/authentication/auth_bloc.dart';
import 'package:flutter_apple_shop/bloc/authentication/auth_event.dart';
import 'package:flutter_apple_shop/bloc/authentication/auth_state.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usernameTextController = TextEditingController(text: 'amirahmad');
    final _passwordTextController = TextEditingController(text: '12345678');

    return Scaffold(
      backgroundColor: ColorsApp.mainBlue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: double.infinity),
                  Image.asset(
                    Assets.imagesIconApplication,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "آپل شاپ",
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _usernameTextController,
                      decoration: InputDecoration(
                        labelText: 'نام کاربری',
                        labelStyle: const TextStyle(
                          fontFamily: 'SM',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: ColorsApp.mainBlue,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        labelText: 'رمز عبور',
                        labelStyle: const TextStyle(
                          fontFamily: 'SM',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: ColorsApp.mainBlue,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<AuthBloc,AuthState>(
                      builder: (context, state) {
                        if(state is AuthInitiateState) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontFamily: 'SB', fontSize: 16),
                              minimumSize: const Size(200, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginRequestEvent(
                                  _usernameTextController.text,
                                  _passwordTextController.text,
                                ),
                              );
                            },
                            child: const Text("ورود به حساب کاربری"),
                          );
                        }
                        if(state is AuthLoadingState) {
                          return const CircularProgressIndicator();
                        }
                        if(state is AuthResponseState) {
                          return state.response
                              .fold((l) => Text(l), (r) => Text(r));
                        }

                        return const Text("error");
                      },
                    ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
