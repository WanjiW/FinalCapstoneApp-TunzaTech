import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:practice_project/accountverification2.dart';
import 'package:practice_project/otpcontroller.dart';
import 'package:practice_project/userinformation.dart';

void main() => runApp(const AccountVerificationA());

class AccountVerificationA extends StatelessWidget {
  const AccountVerificationA({super.key});

  static const String _title = 'AccountVerificationA';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({super.key});

  var OTPControlller = Get.put(OTPController());
  var otp;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 10),
      Container(
          width: 365,
          child: Text("User Verification",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.bold))),
      SizedBox(height: 10),
      Container(
          width: 365,
          child: Text("This is to authenticate your account. Check for an SMS with the code!",
              style: TextStyle(
                  color: Color.fromRGBO(0, 85, 85, 100),
                  fontSize: 17,
                  fontStyle: FontStyle.italic))),
      SizedBox(height: 55),
      OTPTextField(
        length: 6,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 35,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        spaceBetween: 0,
        margin: EdgeInsets.fromLTRB(20, 0, 8, 0),
        onCompleted: (value){
          otp = value;
          OTPController.instance.verifyOTP(otp);
        },
      ),
        SizedBox(height: 30),
        // GestureDetector(
        //     onTap: () {
        //       // AccountVerificationA();
        //     },
        //   child: Container(
        //   width: 365,
        //     child: Text("Resend", style: TextStyle(fontSize: 16, color: Colors.blueGrey, decoration: TextDecoration.underline), textAlign: TextAlign.left,)
        // )),
        SizedBox(height: 7),
        // GestureDetector(
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => (AccountVerificationB())));
        //     },
        //   child: Container(
        //     width: 365,
        //     child: Text("Authenticate with email", style: TextStyle(fontSize: 16, color: Colors.blueGrey, decoration: TextDecoration.underline), textAlign: TextAlign.left,)
        // )),
        SizedBox(height: 45),
          Container(
              child: ElevatedButton(
                  onPressed: () {
                    OTPController.instance.verifyOTP(otp);
                  },
                  child: Text(
                    "Next ->",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromRGBO(116, 199, 243, 100)), fixedSize: MaterialStateProperty.all<Size>(Size(320, 44)))
              )),
          SizedBox(height: 7),
          // GestureDetector(
          //     onTap: () {
          //       Navigator.push(context, UserInformation() as Route<Object?>);
          //     },
          //   child: Container(
          //   width: 365,
          //     child: Text("Resend", style: TextStyle(fontSize: 16, color: Colors.blueGrey, decoration: TextDecoration.underline), textAlign: TextAlign.left,)
          // )),

        ]));
  }
}




// Row(children: [
//   SizedBox(width: 20),
//   Container(
//     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//     width: 50,
//     height: 50,
//     padding: EdgeInsets.all(12.0),
//     child: TextField(
//       // controller: controller.password,
//       decoration: InputDecoration(
//         border: UnderlineInputBorder(),
//       ),
//     )
//   ),
//   SizedBox(width: 15),
//   Container(
//     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//     width: 50,
//     height: 50,
//     padding: EdgeInsets.all(12.0),
//     child: TextField(
//       // controller: controller.password,
//       decoration: InputDecoration(
//         border: UnderlineInputBorder(),
//       ),
//     )
//   ),
//   SizedBox(width: 15),
//   Container(
//     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//     width: 50,
//     height: 50,
//     padding: EdgeInsets.all(12.0),
//     child:
//     TextField(
//     // controller: controller.password,
//     decoration: InputDecoration(
//       border: UnderlineInputBorder(),
//     ),
//   )
//     ,
//   ),
//   SizedBox(width: 15),
//   Container(
//     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//     width: 50,
//     height: 50,
//     padding: EdgeInsets.all(12.0),
//     child: TextField(
//       // controller: controller.password,
//       decoration: InputDecoration(
//         border: UnderlineInputBorder(),
//       ),
//     )
//   ),
//   SizedBox(width: 15),
//   Container(
//     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//     width: 50,
//     height: 50,
//     padding: EdgeInsets.all(12.0),
//     child: TextField(
//       // controller: controller.password,
//       decoration: InputDecoration(
//         border: UnderlineInputBorder(),
//       ),
//     )
//   ),
// ])
// ,
