import 'package:she_sos_v1/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState{

}

class AuthLoading extends AuthState{

}

class Authenticated extends AuthState{
AppUser user;
Authenticated(this.user);
}

class Unauthendicated extends AuthState{

}


class AuthErrors extends AuthState{
final String message;
AuthErrors(this.message);
}
