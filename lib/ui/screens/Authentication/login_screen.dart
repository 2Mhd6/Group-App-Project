import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:group_app_project/theme/app_color.dart';

import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_bloc.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_event.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_state.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/custom_bottom_text.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/custom_button.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/custom_text_field.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/foodprime_logo.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/CustomSnackBar.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: Builder(
        builder: (context) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                CustomSnackBar.show(
                  context: context,
                  message: state.message,
                  isSuccess: false,
                );
              } else if (state is AuthSuccess) {
                CustomSnackBar.show(
                  context: context,
                  message: state.message,
                  isSuccess: true,
                );
                Future.delayed(const Duration(seconds: 2), () {
                  context.go("/home");
                });
              }
            },
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark,
              child: Scaffold(
                backgroundColor: AppColor.background,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        const FoodPrimeLogo(),
                        const SizedBox(height: 40),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColor.text,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          hintText: 'Enter Email',
                          controller: emailController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Enter Password',
                          obscureText: true,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 80),
                        CustomButton(
                          text: 'Login',
                          onPressed: () {
                            context.read<AuthBloc>().add(
                              LoginSubmitted(
                                emailController.text,
                                passwordController.text,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        CustomBottomText(
                          question: "Don’t have an account? ",
                          actionText: "Create account",
                          route: "/signup",
                          questionColor: AppColor.hintText,
                          actionColor: AppColor.buttonColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
