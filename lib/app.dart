import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:she_sos_v1/features/auth/data/firebase_auth_repo.dart';
import 'package:she_sos_v1/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:she_sos_v1/features/auth/presentation/cubits/auth_states.dart';
import 'package:she_sos_v1/features/auth/presentation/pages/auth_page.dart';
import 'package:she_sos_v1/features/home/presentation/pages/home_page.dart';
import 'package:she_sos_v1/features/profile/data/firebase_profile_repo.dart';
import 'package:she_sos_v1/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:she_sos_v1/themes/theme.dart';

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();
  final profileRepo = FirebaseProfileRepo();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //auth cubit
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        ),

        // profile cubit
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(profileRepo: profileRepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is Unauthendicated) {
              return AuthPage();
            }
            if (authState is Authenticated) {
              return HomePage();
            } else {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          },
          listener: (context, authState) {
            if (authState is AuthErrors) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(authState.message)));
            }
          },
        ),
      ),
    );
  }
}
/*
MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is Unauthendicated) {
              return AuthPage();
            }
            if (authState is Authenticated) {
              return HomePage();
            } else {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          },
          listener: (context, authState) {
            if (authState is AuthErrors) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(authState.message),
                ),
              );
            }
          },
        ),
      ),
 */