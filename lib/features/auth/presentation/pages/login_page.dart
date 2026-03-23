import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:she_sos_v1/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:she_sos_v1/themes/theme.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onToggle;
  const LoginPage({super.key, required this.onToggle});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    //  login logic here
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty && password.isNotEmpty) {
      authCubit.login(email, password);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("PLEASE ENTER EMAIL AND PASSWORD")),
      );
    }
  }
@override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _forgotPassword() {
    // Implement forgot password logic here
  }

  void _register() {
    // Implement registration logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60),
            // Logo
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shield_rounded,
                size: 44,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: AppSpacing.xl),

            const Text(
              'Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'Sign in to continue',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.xxxl),

            // Email
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline_rounded),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Login button
            ElevatedButton(onPressed: _login, child: const Text('Login')),

            const SizedBox(height: AppSpacing.xl),

            // Register link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                TextButton(
                  onPressed: widget.onToggle,

                  child: const Text('Create Account'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
