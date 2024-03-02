import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/reusables/my_button.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/reusables/my_text_field.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/blocs/login-cubit/login_cubit.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({required this.onTap, super.key});
  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
//text controller
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final cubitSignIn = BlocProvider.of<LoginCubit>(context).loginNewUser;

    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyText(
                    text: 'HELLO AGAIN',
                    style: GoogleFonts.robotoSlab(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: theme.primary,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 0.5.dp),
                      // email textfield
                      MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obsecureText: false,
                        icon: const Icon(Icons.person),
                      ),

                      SizedBox(height: 0.22.dp),

                      // password textfield
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obsecureText: true,
                        icon: const Icon(Icons.lock),
                      ),
                      ForgetPasswordButton(theme: theme),
                      SizedBox(height: 0.2.dp),

                      // LOGIN BUTTON
                      MyButton(
                        onPressed: () {
                          if (passwordController.text.isNotEmpty) {
                            cubitSignIn(
                              emailController.text,
                              passwordController.text,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.redAccent[400],
                                content: MyText(
                                  text: 'Please enter password!',
                                  style:
                                      typoGraphy.textTheme.titleLarge!.copyWith(
                                    color: theme.primary,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color(0xff36382d),
                          foregroundColor: theme.background,
                          fixedSize: Size(
                            Adaptive.w(0.55.dp),
                            Adaptive.h(5.5),
                          ),
                        ),
                        child: MyText(
                          text: 'Login',
                          style: typoGraphy.textTheme.bodyLarge!.apply(
                            color: theme.brightness == Brightness.dark
                                ? theme.primary
                                : theme.background,
                          ),
                        ),
                      ),

                      SizedBox(height: 0.3.dp),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: 'Not a member?',
                            style: typoGraphy.textTheme.titleMedium!
                                .apply(color: theme.primary),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: MyText(
                              text: 'Register now',
                              style: typoGraphy.textTheme.titleMedium!
                                  .apply(color: theme.primary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
