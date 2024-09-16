import 'package:bloc_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp; //USERSIGNUP USECASE
  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    //ESTA FUNCION SE EJECUTARA DESDE EL SIGUPP PORQUE SE AGREGO EL EVENTO MEDIANTE EL CONTEXT
    //LLAMANDO AL USERSIGNUP USECASE
    on<AuthSignUp>((event, emit) async {
      final res = await   _userSignUp(UserSignUpParams(
          email: event.email, password: event.password, name: event.name));

      res.fold((failure) => emit(AuthFailure(failure.message)),
          (uid) => emit(AuthSuccess(uid)));
    });
  }
}
