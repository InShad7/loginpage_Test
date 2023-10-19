import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newlogin/view/homescreen/loginscreen.dart';
import '../../registersceen/registerscreen.dart';
import '../../utils/utils.dart';

class CreateStudentWidget extends StatelessWidget {
  const CreateStudentWidget({
    super.key,
    this.create = false,
  });
  final bool create;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: create ? 'Create a new account ' : 'Already have an account',
        style: TextStyle(fontSize: 18, color: black),
        children: <TextSpan>[
          TextSpan(
            text: create ? '  Sign up' : '  Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          create ? RegisterScreen() : LoginPage(),
                    ),
                    (route) => false);
              },
          ),
        ],
      ),
    );
  }
}
