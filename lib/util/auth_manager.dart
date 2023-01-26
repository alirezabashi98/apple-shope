import 'package:flutter/cupertino.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  static final SharedPreferences _sharedPref = locator.get();

  static void saveToken(String token) async {
    _sharedPref.setString('access_token', token);
    authChangeNotifire.value = token;
  }

  static String readAuth() => _sharedPref.getString('access_token') ?? '';

  static void logout(){
    _sharedPref.clear();
    authChangeNotifire.value = null;
  }

  static bool isLogin(){
    String token = readAuth();
    return token.isNotEmpty;
  }
}