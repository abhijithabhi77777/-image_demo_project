import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      home: const LoginScreen(),
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Loginn(),
//     );
//   }
// }

// class Loginn extends StatelessWidget {
//   final LoginController loginController = Get.put(LoginController());
//   Loginn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Spacer(),
//               // Image.asset(
//               //   'assets/images/logo.png',
//               //   height: 150,
//               //   fit: BoxFit.fitHeight,
//               // ),
//               SizedBox(height: 32.0),
//               TextField(
//                 controller: loginController.emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: 'Email address',
//                   prefixIcon: Icon(Icons.email),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//                 controller: loginController.passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               SizedBox(height: 32.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Perform login operation here
//                 },
//                 child: Text('Login'),
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoginController extends GetxController {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   Future<void> login() async {
//     try {
//       // Call your login API here using the email and password entered by the user
//       // For example, using the http package:
//       final response = await http.post(
//           Uri.parse(
//               'https://cms-qf-default-rtdb.asia-southeast1.firebasedatabase.app/users/-NMtVWPCThYetzT2tBQ8.jsonc'),
//           body: {
//             'email': emailController.text,
//             'password': passwordController.text,
//           });

//       if (response.statusCode == 200) {
//         // Login successful, navigate to the next screen
//         Get.offNamed('/home');
//       } else {
//         // Login failed, display error message
//         Get.snackbar('Error', 'Invalid email or password');
//       }
//     } catch (e) {
//       // Display error message
//       Get.snackbar('Error', 'Failed to login: $e');
//     }
//   }
// }
