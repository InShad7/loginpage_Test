import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../view/utils/utils.dart';

class MyControllers {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


//base Url
  final baseUrl = 'https://gyanmeeti.in/API';

//register a student============================================================
  Future<void> registerStudent(String name, String phone, String email,
      String state, String password) async {

    final url = Uri.parse(baseUrl);//url parsed

    final Map<String, String> data = {
      'name': name,
      'phone': phone,
      'email': email,
      'state': state,
      'password': password,
    };//body for registration

    try {
      final response = await http.post(url, body: data); //post the body to the server

      if (response.statusCode == 200) {
        // if registration successful
        final Map<String, dynamic> responseData = json.decode(response.body);
        log(responseData['message']);
        Fluttertoast.showToast(msg: 'Registration successful');
        
      } else {
        log('Failed to connect to the server. Status code: ${response.statusCode}');
        Fluttertoast.showToast(
            msg: 'Failed to connect the server', backgroundColor: red);
            //failed to connect to the server
      }
    } catch (e) {
      log('Error: $e');
    }
  }
//login student================================================================

  Future<void> loginUser(String phone, String password) async {

    final url = Uri.parse(baseUrl);//parse the url

    final Map<String, String> data = {
      'phone': phone,
      'password': password,
    };//body for login user

    try {
      final response = await http.post(url, body: data); //post the body for login user

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData['message'] == 'Login successful') {
          Fluttertoast.showToast(msg: 'Login successful');//login successful
          final user = responseData['user'][0];//user detail
          log('User ID: ${user['id']}');
          log('Name: ${user['name']}');
        } else if (responseData['message'] == 'Account has been Deactivated') {
          Fluttertoast.showToast(msg: 'Account has been deactivated');//acount has been deactivated
          log('Account has been deactivated');
        } else {
          Fluttertoast.showToast(msg: 'Invalid username or password');
          log('Invalid username and password');//invalid username or password
        }
      } else {
        Fluttertoast.showToast(
            msg: ' failed to connect the server ', backgroundColor: red);
        log('Failed to connect to the server. Status code: ${response.statusCode}');
        //failed to connect to the server
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
