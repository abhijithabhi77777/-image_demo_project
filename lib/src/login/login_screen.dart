import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User name"),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Color(0xffBBCFD1), width: 1.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        // color: Color(0xffBBCFD1),
                        width: 1.0)),
                focusColor: Colors.white,
                fillColor: Colors.grey,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 1.2)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 1.2)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("password"),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Color(0xffBBCFD1), width: 1.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        // color: Color(0xffBBCFD1),
                        width: 1.0)),
                focusColor: Colors.white,
                fillColor: Colors.grey,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 1.2)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 1.2)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Obx(
                () {
                  return InkWell(
                    onTap: () {
                      print("test");
                      Get.to(() => HomeScreen());
                    },

                    //  async {
                    //   if (!loginController.isLoading) {
                    //     await loginController.loginToTheApp(
                    //         username: userNameController.text,
                    //         password: passwordController.text);
                    //     Get.to(() => HomeScreen());
                    //   }
                    // },
                    child: Container(
                      color: loginController.isLoading
                          ? Colors.grey
                          : Colors.green,
                      padding: EdgeInsets.all(20),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
