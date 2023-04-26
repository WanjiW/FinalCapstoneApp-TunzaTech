import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:practice_project/accountsettings.dart';
import 'package:practice_project/changepassword.dart';
import 'package:practice_project/faqs.dart';
import 'package:practice_project/importantcontacts.dart';
import 'package:practice_project/main.dart';
import 'package:practice_project/privacypolicy.dart';
import 'package:practice_project/pwdinfo.dart';
import 'package:practice_project/signupcontroller.dart';
import 'package:practice_project/termsandconditions.dart';

void main() => runApp(const ProfilePage());

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String _title = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
          appBar: AppBar(
              toolbarHeight: 140,
              leadingWidth: 90,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(alignment: Alignment.bottomLeft, child: Container(width: 100, height: 190, child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 22)))
          )),
          body: MyStatelessWidget()),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({super.key});

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
          SizedBox(width: 250),
          Container(
            // height: 200,
            // width: 200,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100)),
            child: Image.asset("assets/images/profile_pic.png", scale: 0.8),
          ),

        // GestureDetector(
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => ((ImportantContactsPage()))));
        //     },
        //     child: Icon(Icons.ac_unit)),
        //   GestureDetector(
        //       onTap: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => (PwDInfoPage())));
        //       },
        //       child: Icon(Icons.access_alarm)
        //   ),

          // profile options
          SizedBox(height: 65),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (FAQPage())));
            },
            child: Row(
            children: [
              SizedBox(width: 45),
              Container(height: 30, width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all()),
                  child: Icon(Icons.question_mark, size: 20)),
              SizedBox(width: 15),
              Text("FAQs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
              SizedBox(width: 185),
              Icon(Icons.arrow_forward_ios_rounded, size: 20),
              SizedBox(height: 10),
            ],
          )),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 15),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (AccountSettingsPage())));
            },
            child: Row(
            children: [
              SizedBox(width: 47),
              Container(height: 30, width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all()),
                  child: Icon(Icons.person, size: 20)),
              SizedBox(width: 15),
              Text("Account Settings", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
              SizedBox(width: 85),
              Icon(Icons.arrow_forward_ios_rounded, size: 20),
              SizedBox(height: 10),
            ],
          )),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 15),

        // GestureDetector(
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => (ChangePasswordPage())));
        //     },
        //     child: Row(
        //     children: [
        //       SizedBox(width: 47),
        //       Container(height: 30, width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all()),
        //           child: Icon(Icons.password, size: 20)),
        //       SizedBox(width: 15),
        //       Text("Change Password", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
        //       SizedBox(width: 75),
        //       Icon(Icons.arrow_forward_ios_rounded, size: 20),
        //       SizedBox(height: 10),
        //     ],
        //   )),
        //   Divider(color: Colors.grey, thickness: 1),
        //   SizedBox(height: 15),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (PrivacyPolicyPage())));
            },
            child: Row(
            children: [
              SizedBox(width: 47),
              Container(height: 30, width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all()),
                  child: Icon(Icons.lock, size: 20)),
              SizedBox(width: 15),
              Text("Privacy Policy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
              SizedBox(width: 113),
              Icon(Icons.arrow_forward_ios_rounded, size: 20),
              SizedBox(height: 10),
            ],
          )),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 15),

        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (TsandCsPage())));
            },
            child: Row(
            children: [
              SizedBox(width: 47),
              Container(height: 30, width: 30, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all()),
                  child: Icon(Icons.library_books, size: 20)),
              SizedBox(width: 15),
              Text("Terms and Conditions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
              SizedBox(width: 41),
              Icon(Icons.arrow_forward_ios_rounded, size: 20),
              SizedBox(height: 10),
            ],
          )),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 50),

          Container(
            // height: 45,
            // width: 180,
              child: ElevatedButton(
                  onPressed: () {
                      // here, add validators: after validation, so valid email and password, all field filled
                      SignUpController.instance.signOutUser();
                      // Get.deleteAll();

                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromRGBO(116, 199, 243, 100)), fixedSize: MaterialStateProperty.all<Size>(Size(240, 44)))))





        ]));
  }
}
