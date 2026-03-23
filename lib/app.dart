import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:she_sos_v1/features/auth/data/firebase_auth_repo.dart';
import 'package:she_sos_v1/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:she_sos_v1/features/auth/presentation/cubits/auth_states.dart';
import 'package:she_sos_v1/features/auth/presentation/pages/auth_page.dart';
import 'package:she_sos_v1/pages/home_page.dart';
import 'package:she_sos_v1/themes/theme.dart';

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),

      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: BlocConsumer<AuthCubit, AuthState>(builder: (context, authState) {
          if(authState is Unauthendicated){
            return AuthPage();
          }if(authState is Authenticated){
            return HomePage();
          }
          else{
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          }
        }, listener: (context, state) {
          
        },)
      ),
    );
  }
}
/*

 */