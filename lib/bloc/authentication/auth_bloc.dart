import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/bloc/authentication/auth_event.dart';
import 'package:flutter_apple_shop/bloc/authentication/auth_state.dart';
import 'package:flutter_apple_shop/data/repository/authentication_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRipository _repository = locator.get();

  AuthBloc() : super(AuthInitiateState()) {
    on<AuthLoginRequestEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        var response = await _repository.login(event.username, event.password);
        emit(AuthResponseState(response));
      },
    );
  }
}
