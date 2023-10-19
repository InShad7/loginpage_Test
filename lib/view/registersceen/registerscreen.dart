import 'package:flutter/material.dart';
import 'package:newlogin/controller/controler.dart';
import 'package:newlogin/view/homescreen/widget/create_btn_widget.dart';
import 'package:newlogin/view/utils/utils.dart';
import '../homescreen/widget/customTextfiled.dart';
import '../homescreen/widget/sign_in_btn.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MyControllers controls = MyControllers();
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height / 1.35,
              child: Form(
                key: _formKey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/register.jpeg'),
                    CustomTextField(
                      controller: controls.nameController,
                      hintText: 'Name',
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Name can\'t be empty';
                        }
                      },
                    ),
                    CustomTextField(
                      controller: controls.emailController,
                      hintText: 'Email',
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Email can\'t be empty';
                        }
                      },
                    ),
                    CustomTextField(
                      controller: controls.phoneController,
                      hintText: 'Phone number',
                      isNum: true,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Phone Number can\'t be empty';
                        }
                      },
                    ),
                    CustomTextField(
                      controller: controls.stateController,
                      hintText: 'State',
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'State can\'t be empty';
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
                  ],
                ),
              ),
            ),
            SignInBtn(formKey: _formKey2, controls: controls, create: true),
            const SizedBox(height: 20),
            const CreateStudentWidget()
          ],
        ),
      ),
    );
  }
}
