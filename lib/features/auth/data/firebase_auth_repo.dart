import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:she_sos_v1/features/auth/domain/entities/app_user.dart';
import 'package:she_sos_v1/features/auth/domain/repos/auth_repo.dart';
import 'package:she_sos_v1/configs/mylogs/my_logs.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    try {
      final firebaseUser = firebaseAuth.currentUser;

      if (firebaseUser != null) {
        MyLog.highlight(
          "FirebaseAuthRepo:== Current user: ${firebaseUser.uid}",
        );
        return AppUser(
          uid: firebaseUser.uid,
          email: firebaseUser.email!,
          name: "",
       
        );
      } else {
        MyLog.highlight("FirebaseAuthRepo:== No current user");
        return null;
      }
    } catch (e) {
      MyLog.error("FirebaseAuthRepo:== Failed to get current user: $e");
      throw Exception("Failed to get current user: $e");
    }
  }

  @override
  Future<AppUser?> registerWithEmailandPassword(
    String name,
    String email,
    String password,
    
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
       
      );

      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(user.toJson());

      MyLog.highlight("FirebaseAuthRepo:== User signed up: ${user.uid}");
      return user;
    } catch (e) {
      MyLog.error("FirebaseAuthRepo:== Failed to sign up: $e");
      throw Exception("Failed to sign in: $e");
    }
  }

  @override
  Future<AppUser?> signInWithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: "",
       
      );
      MyLog.highlight("FirebaseAuthRepo:== User signed in: ${user.uid}");
      return user;
    } catch (e) {
      MyLog.error("FirebaseAuthRepo:== Failed to sign in: $e");
      throw Exception("Failed to sign in: $e");
    }
  }

  @override
  Future<void> signOut() async {
    // TODO: implement signOut
    MyLog.highlight(
      "FirebaseAuthRepo:== User signed out: ${firebaseAuth.currentUser?.uid}",
    );
    await firebaseAuth.signOut();
  }
}
