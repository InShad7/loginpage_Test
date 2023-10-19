import 'package:flutter/material.dart';
import 'package:newlogin/controller/controler.dart';
import '../utils/utils.dart';
import 'widget/create_btn_widget.dart';
import 'widget/customTextfiled.dart';
import 'widget/sign_in_btn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MyControllers controls = MyControllers();
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height / 1.8,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/login.jpeg',
                  ),
                  CustomTextField(
                    controller: controls.phoneController,
                    hintText: 'Phone Number',
                    isNum: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Phone Number can\'t be empty';
                      }
                    },
                  ),
                  CustomTextField(
                    controller: controls.passwordController,
                    hintText: 'Password',
                    isPass: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Password can\'t be empty';
                      }
                    },
                  ),
                  SignInBtn(formKey: _formKey, controls: controls),
                ],
              ),
            ),
          ),
          const CreateStudentWidget(create: true)
        ],
      ),
    );
  }
}
