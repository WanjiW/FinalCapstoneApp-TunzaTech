// WORKING - SAME CODE AS SIGN UP, BUT IT WAS TESTED SUCCESSFULLY FROM HERE


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:practice_project/onboarding1.dart';
// import 'package:practice_project/signin.dart';
// import 'package:practice_project/firebase_authcodes.dart';
// import 'package:practice_project/signupcontroller.dart';
//
// void main() {
//   runApp(SignUp());
//   // Firebase.initializeApp();
// }
//
// class SignUp extends StatelessWidget {
//   const SignUp ({Key? key}) : super(key: key);
//
//   static const String _title = 'SignUpPage';
//   // Future<FirebaseApp> _initializeFirebase() async {
//   //   FirebaseApp firebaseApp = await Firebase.initializeApp();
//   //   return firebaseApp;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: _title,
//       home: Scaffold(
//           // appBar: AppBar(title: const Text(_title)),
//           body:
//               Center(
//         child: SingleChildScrollView(child: MyStatefulWidget()),
//       )
//           ),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//
//   final controller = Get.put(SignUpController());
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Container(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(height: 10),
//           Container(
//               width: 365,
//               child: Text("Sign Up",
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold))),
//           SizedBox(height: 10),
//           Container(
//               width: 365,
//               child: Text("Welcome!",
//                   style: TextStyle(
//                       color: Color.fromRGBO(0, 85, 85, 100),
//                       fontSize: 20,
//                       fontStyle: FontStyle.italic))),
//           SizedBox(height: 55),
//           Container(
//               width: 365,
//               child: TextField(
//                 controller: controller.fullName,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Full Name',
//                 ),
//               )),
//           SizedBox(height: 20),
//           Container(
//               width: 365,
//               child: TextField(
//                 controller: controller.email,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Email',
//                 ),
//               )),
//           SizedBox(height: 20),
//           Container(
//               width: 365,
//               child: TextField(
//                 controller: controller.phoneNumber,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Phone Number',
//                 ),
//               )),
//           SizedBox(height: 20),
//           Container(
//               width: 365,
//               child: TextField(
//                 controller: controller.password,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Password',
//                 ),
//               )),
//           SizedBox(height: 15),
//           SizedBox(height: 15),
//           Container(
//               // height: 45,
//               // width: 180,
//               child: ElevatedButton(
//                   //   }
//                   onPressed: () async {
//                     if (_formKey.currentState != null &&
//                         _formKey.currentState!.validate()) {
//                       // here, add validators: after validation, so valid email and password, all field filled
//                       SignUpController.instance.registerNewUser(
//                           controller.email.text, controller.password.text);
//                     }
//                   },
//                   child: Text(
//                     "Sign Up",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                     textAlign: TextAlign.center,
//                   ),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           Color.fromRGBO(116, 199, 243, 100)),
//                       fixedSize:
//                           MaterialStateProperty.all<Size>(Size(365, 44))))),
//           Container(
//               width: 365,
//               child: ElevatedButton(
//                   onPressed: () {},
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/google_icon.png',
//                           width: 20,
//                           height: 20,
//                         ),
//                         SizedBox(width: 9),
//                         Text("Sign Up With Google",
//                             textAlign: TextAlign.center,
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 16)),
//                       ]),
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.white),
//                       fixedSize:
//                           MaterialStateProperty.all<Size>(Size(365, 44))))),
//           SizedBox(height: 10),
//           GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => (SignIn())));
//               },
//               child: Container(
//                   child: RichText(
//                       text: TextSpan(
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: "Already have an account?",
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromRGBO(96, 91, 91, 100))),
//                   TextSpan(
//                       text: " Sign In here!",
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromRGBO(116, 199, 243, 100)))
//                 ],
//               )))),
//         ],
//       )),
//     );
//   }
// }
