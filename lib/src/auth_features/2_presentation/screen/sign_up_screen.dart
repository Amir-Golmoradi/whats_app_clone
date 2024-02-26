import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/signup_column.dart';
import 'package:whats_app_clone/src/auth_features/2_presentation/widget/signup_header.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.onTap}) : super(key: key);
  final void Function()? onTap;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

//dispose text controller
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HeaderSection(),
                SizedBox(height: 0.4.dp),
                SignUpCol(
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  widget: widget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
