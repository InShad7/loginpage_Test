import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newlogin/view/utils/utils.dart';

import '../../../controller/controler.dart';

class SignInBtn extends StatelessWidget {
  const SignInBtn({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.controls,
    this.create = false,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final MyControllers controls;
  final bool create;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
      width: MediaQuery.of(context).size.width / 1.09,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (create) {
              controls.registerStudent(
                controls.nameController.text,
                controls.phoneController.text,
                controls.emailController.text,
                controls.stateController.text,
                controls.passwordController.text,
              );
            } else {
              controls.loginUser(
                controls.phoneController.text,
                controls.passwordController.text,
              );
            }
          } else {
            Fluttertoast.showToast(
              msg: 'Please enter valid credentials!',
              backgroundColor: red,
            );
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          create ? 'Sign Up' : 'Login',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
