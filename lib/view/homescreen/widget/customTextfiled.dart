import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newlogin/view/utils/utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.isNum = false,
    this.isPass = false,
  });

  final TextEditingController controller;
  final hintText;
  final validator;
  final bool isNum;
  final bool isPass;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white2,
      ),
      child: TextFormField(
        inputFormatters: isNum
            ? [
                FilteringTextInputFormatter.allow(
                  RegExp(r"[0-9]"),
                ),
              ]
            : [
                FilteringTextInputFormatter.allow(
                  RegExp(r"[a-zA-Z0-9@._-]"),
                ),
              ],
        obscureText: isPass,
        controller: controller,
        autofocus: false,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText),
        validator: validator,
      ),
    );
  }
}
