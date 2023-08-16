import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stc_health_app/src/controllers/login_screen_controller.dart';
import '../custom_widgets/app_main_button.dart';
import '../custom_widgets/app_text_form_field.dart';
import '../theme/app_text_theme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.put(LoginScreenController());
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF188095),
                  Color(0xFF2AB3C6),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
              )),
              child: Column(children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height / 2) - 60,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "STC \n HEALTH",
                          style: appNameStyle,
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 30.0,
                    ),
                    child: Text(
                      "Log In",
                      style: loginTextStyle,
                    ),
                  ),
                ]),
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(children: [
                AppTextFormField(
                  controller: controller.usernameController,
                  labelText: "Username",
                  obscureText: false,
                  maxLength: 1,
                  suffixIcon: const Icon(Icons.check_circle_outline),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an username';
                    }
                    return null;
                    //This is the Expression to use for a valid email input I commented it because we are using api login details

                    //RegExp emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                    //if (!emailRegExp.hasMatch(value)) {
                    //return 'Please enter a valid email';
                    //}
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Obx(
                  () => AppTextFormField(
                    controller: controller.passwordController,
                    labelText: "Password",
                    maxLength: 1,
                    obscureText: !controller.isPasswordVisible.value,
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.togglePasswordVisibility();
                      },
                      child: Icon(controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                AppButton(
                    height: 74,
                    screenWidth: MediaQuery.of(context).size.width,
                    controller: controller,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.loginUser();
                        controller.clearControllers();
                      }
                    },
                    buttonText: "Continue",
                    screenWidthMultiplier: 1),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "NEED HELP?",
                        style: textButtonStyle,
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
