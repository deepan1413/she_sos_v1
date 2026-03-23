import 'package:she_sos_v1/features/auth/domain/entities/app_user.dart';

//operations for authentication

abstract class AuthRepo {
  Future<AppUser?> signInWithEmailandPassword(String email, String password);
  Future<AppUser?> registerWithEmailandPassword(
    String name,
    String email,
    String password,
  );
  Future<void> signOut();
  Future<AppUser?> getCurrentUser();
}
