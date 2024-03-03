import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/core/I18n/messages.dart';
import 'package:whats_app_clone/core/reusables/my_button.dart';
import 'package:whats_app_clone/core/reusables/my_text.dart';
import 'package:whats_app_clone/core/theme/typo.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/blocs/signup-cubit/sign_up_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(this.emailController, this.passwordController,
      this.confirmPasswordController,
      {super.key,});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    final addCubitUser = BlocProvider.of<SignUpCubit>(context);
    final theme = Theme.of(context).colorScheme;
    return MyButton(
      onPressed: () {
        if (passwordController.text != confirmPasswordController.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent[400],
              content: MyText(
                  text: AppMessage.passwordAlert.tr,
                  style: typoGraphy.textTheme.titleLarge!
                      .copyWith(color: theme.primary),),
            ),
          );
        } else if (passwordController.text == confirmPasswordController.text) {
          addCubitUser.createNewUser(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color(0xff36382d),
        fixedSize: Size(
          Adaptive.w(0.55.dp),
          Adaptive.h(5.5),
        ),
      ),
      child: MyText(
        text: AppMessage.signUp.tr,
        style: typoGraphy.textTheme.bodyLarge!.apply(
          color: theme.brightness == Brightness.dark
              ? theme.primary
              : theme.background,
        ),
      ),
    );
  }
}
