import 'package:bloc_clean_architecture/core/theme/app_pallete.dart';
import 'package:bloc_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_clean_architecture/features/auth/presentation/pages/login_page.dart';
import 'package:bloc_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:bloc_clean_architecture/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AuthField(
                  hintText: 'Name',
                  controller: nameController,
                  isObscureText: false),
              const SizedBox(height: 15),
              AuthField(
                hintText: 'Email',
                controller: emailController,
                isObscureText: false,
              ),
              const SizedBox(height: 15),
              AuthField(
                  hintText: 'Password',
                  controller: passwordController,
                  isObscureText: true),
              const SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Si el formulario es válido, añade el evento de registro (AuthSignUp)
                    // al AuthBloc, con los datos ingresados de email, password y name.
                    // Estos valores son obtenidos de los controladores correspondientes.
                    context.read<AuthBloc>().add(AuthSignUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        name: nameController.text.trim()));
                  }
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
