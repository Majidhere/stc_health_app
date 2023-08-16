import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:stc_health_app/src/screens/product_screen.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController get instance => Get.find();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void clearControllers() {
    usernameController.clear();
    passwordController.clear();
  }

  //This is the function where I call the login Api and get token to login user to the App

  Future<void> loginUser() async {
    const String apiUrl = 'https://fakestoreapi.com/auth/login';
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String token = responseData['token'];
      //I printed the token for testing purposes
      debugPrint(token);
      Get.to(() => ProductScreen());
    } else {
      Get.snackbar(
        'Error',
        "Failed to login Please Enter correct username and password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
