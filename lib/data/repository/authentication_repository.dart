import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasource/authentication_datasource.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';
import 'package:flutter_apple_shop/util/auth_manager.dart';

abstract class IAuthRipository {
  Future<Either<String, String>> register(
    String username,
    String password,
    String passwordConfirm,
  );

  Future<Either<String, String>> login(
    String username,
    String password,
  );
}

class AuthenticationRepository implements IAuthRipository {
  final IAuthenticacationDataSource _datasource = locator.get();
  @override
  Future<Either<String, String>> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      await _datasource.register(username, password, passwordConfirm);
      return right('success register');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    var loginErrorMessage = 'خطایی در ورود پیش آمده! ';
    try {
      String token = await _datasource.login(username, password);
      if (token.isNotEmpty) {
       AuthManager.saveToken(token);
        return right('شما وارد شده اید');
      } else {
        return left(loginErrorMessage);
      }
    } on ApiException catch (ex) {
      return left(ex.message ?? loginErrorMessage);
    }
  }
}
