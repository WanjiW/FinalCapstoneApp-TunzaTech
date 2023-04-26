import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice_project/accountverification1.dart';
import 'package:practice_project/onboarding1.dart';
import 'package:practice_project/signin.dart';
import 'package:practice_project/firebase_authcodes.dart';
import 'package:practice_project/signupcontroller.dart';
import 'package:practice_project/authentication_repo.dart';
import 'package:practice_project/userinformation.dart';
import 'package:practice_project/usermodel.dart';
import 'package:practice_project/validation.dart';

import 'monitorsensordata.dart';

void main() {
  runApp(SignUp());
  // Firebase.initializeApp();
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String _title = 'SignUpPage';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
          // appBar: AppBar(title: const Text(_title)),
          body: Center(
        child: SingleChildScrollView(child: MyStatefulWidget()),
      )),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final controller = Get.put(SignUpController());
  final _formKeyA = GlobalKey<FormState>();

  late Future future;
  late bool _hidePswd = true;

  void dispose() {
    // Dispose of _formKeyA when the widget is removed from the tree
    _formKeyA.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

            return Form(
              key: _formKeyA,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Container(
                      width: 365,
                      child: Text("Sign Up",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 40,
                              fontWeight: FontWeight.bold))),
                  SizedBox(height: 10),
                  Container(
                      width: 365,
                      child: Text("Welcome!",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 85, 85, 100),
                              fontSize: 20,
                              fontStyle: FontStyle.italic))),
                  SizedBox(height: 55),
                  Container(
                      width: 365,
                      child: TextFormField(
                          controller: controller.fullName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Full Name',
                          ),
                          onSaved: (value){
                            controller.fullName == value;
                          },
                          validator: textInputValidator)),
                  SizedBox(height: 20),
                  Container(
                      width: 365,
                      child: TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                          onSaved: (value){
                            controller.email == value;
                          },
                          validator: emailValidator)),
                  SizedBox(height: 20),
                  Container(
                      width: 365,
                      child: TextFormField(
                          controller: controller.phoneNumber,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  'Phone Number', // add length restriction so country code is used
                              helperText: 'Enter number with country code!'),
                          onSaved: (value){
                            controller.phoneNumber == value;
                          },
                          validator: phoneNumberValidator)),
                  SizedBox(height: 20),
                  Container(
                      width: 365,
                      child: TextFormField(
                          controller: controller.password,
                          obscureText: _hidePswd,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: (){
                                print("tapping");
                                setState(() {
                                  _hidePswd = !_hidePswd;
                                });
                              },
                                child: Icon(Icons.remove_red_eye_rounded),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            helperText:
                                'Password must have: \n 1. At least one digit [0-9] \n 2. At least one lowercase character \n 3. At least one uppercase character \n 4. At least one special character \n 5. At least 8 characters in length, but no more than 15.',
                          ),
                          onSaved: (value){
                            controller.password == value;
                          },
                          validator: passwordValidator)),
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                  Container(
                      // height: 45,
                      // width: 180,
                      child: ElevatedButton(
                          //   }
                          onPressed: () async {
                            print(_formKeyA.currentState!.validate());
                            if (_formKeyA.currentState != null &&
                                _formKeyA.currentState!.validate()) {
                              SignUpController.instance.registerNewUser(
                                  controller.email.text.trim(),
                                  controller.password.text.trim(),
                                  controller.phoneNumber.text.trim()
                              );

                              // call function that saves the data added in the form!
                              final user = UserModel(
                                  email: controller.email.text.trim(),
                                  password: controller.password.text.trim(),
                                  fullName: controller.fullName.text.trim(),
                                  phoneNo: controller.phoneNumber.text.trim());

                              SignUpController.instance.createUserDetails(user);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Signed Up!")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Double-check form fields!")));
                            }

                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(116, 199, 243, 100)),
                              fixedSize: MaterialStateProperty.all<Size>(
                                  Size(365, 44))))),
                  SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (SignIn())));
                      },
                      child: Container(
                          child: RichText(
                              text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Already have an account?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(96, 91, 91, 100))),
                          TextSpan(
                              text: " Sign In here!",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(116, 199, 243, 100)))
                        ],
                      )))),
                ],
              )),
            );

  }
}

