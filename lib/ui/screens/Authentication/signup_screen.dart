import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

import 'package:group_app_project/theme/app_color.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_bloc.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_event.dart';
import 'package:group_app_project/ui/screens/Authentication/bloc/authentication_state.dart';
import 'package:group_app_project/ui/screens/Authentication/login_screen.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/CustomSnackBar.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/custom_bottom_text.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/custom_button.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/custom_text_field.dart';
import 'package:group_app_project/ui/widgets/Login%20&%20signup/foodprime_logo.dart';
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
                  if(context.mounted){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
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
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColor.text,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          hintText: 'User name',
                          controller: usernameController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Email',
                          controller: emailController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Password',
                          obscureText: true,
                          controller: passwordController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Phone Number',
                          controller: phoneController,
                        ),
                        const SizedBox(height: 80),
                        CustomButton(
                          text: 'Sign Up',
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  SignUpSubmitted(
                                    usernameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    phoneController.text,
                                  ),
                                );
                          },
                        ),
                        const SizedBox(height: 24),
                        CustomBottomText(
                          question: "Already have an account? ",
                          actionText: "Log In",
                          screen: LoginScreen(),
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
