import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:she_sos_v1/features/auth/domain/entities/app_user.dart';
import 'package:she_sos_v1/features/auth/domain/repos/auth_repo.dart';
import 'package:she_sos_v1/features/auth/presentation/cubits/auth_states.dart';
import 'package:she_sos_v1/mylogs/my_logs.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //check auth
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;

      MyLog.highlight("AuthCubit:== Aunthenticated ${user.name}");

      emit(Authenticated(user));
    } else {
      MyLog.highlight("AuthCubit:== Unaunthenticated }");

      emit(Unauthendicated());
    }
  }

  //
  AppUser? get currentUser => _currentUser;

  //login

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.signInWithEmailandPassword(email, password);
      if (user != null) {
        _currentUser = user;
        MyLog.highlight("AuthCubit:== Aunthenticated ${user.name}");

        emit(Authenticated(user));
      } else {
        MyLog.highlight("AuthCubit:== Unaunthenticated }");

        emit(Unauthendicated());
      }
    } catch (e) {
      MyLog.error(e.toString());
      emit(AuthErrors(e.toString()));
      emit(Unauthendicated());
    }
  }

  //register

  Future<void> register(String name, String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailandPassword(
        name,
        email,
        password,
      );
      if (user != null) {
        _currentUser = user;
        MyLog.highlight("AuthCubit:== Aunthenticated ${user.name}");

        emit(Authenticated(user));
      } else {
        MyLog.highlight("AuthCubit:== Unaunthenticated }");

        emit(Unauthendicated());
      }
    } catch (e) {
      MyLog.error(e.toString());
      emit(AuthErrors(e.toString()));
      emit(Unauthendicated());
    }
  }

  Future<void> logout() async {
    await authRepo.signOut();
    emit(Unauthendicated());
  }
}
