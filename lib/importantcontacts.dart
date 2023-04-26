import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice_project/homepage.dart';
import 'package:practice_project/profilecontroller.dart';
import 'package:practice_project/pwdinfo.dart';
import 'package:practice_project/usermodel.dart';

import 'bottomnavigationbar.dart';

void main() => runApp(const ImportantContactsPage());

class ImportantContactsPage extends StatefulWidget {
  const ImportantContactsPage({super.key});

  static const String _title = 'ImportantContactsPage';

  @override
  State<ImportantContactsPage> createState() => _ImportantContactsPageState();
}

class _ImportantContactsPageState extends State<ImportantContactsPage> {
  int _currentIndex = 2;

  void _onItemTapped(int index) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ImportantContactsPage._title,
        routes: {
          '/pwdinfo': (context) => PwDInfoPage(),
          '/homepage': (context) => HomePage(),
          '/importantcontacts': (context) => Scaffold(
                body: SingleChildScrollView(child: MyStatefulWidget()),
                bottomNavigationBar: MyBottomNavigationBar(
                    currentIndex: _currentIndex, onTap: _onItemTapped),
              ),
        },
        home: Scaffold(
            appBar: AppBar(
                toolbarHeight: 120,
                leadingWidth: 90,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            width: 100,
                            height: 100,
                            child: Icon(Icons.arrow_back_ios_new_rounded,
                                color: Colors.black, size: 22))))),
            body: SingleChildScrollView(child: MyStatelessWidget()),
            bottomNavigationBar: MyBottomNavigationBar(
                currentIndex: _currentIndex, onTap: _onItemTapped)));
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getPWDDataFromUserData(),
        builder: (context, snapshot) {
          print("controllor.getPWDDataFromUserData()");
          print(controller
              .getPWDDataFromUserData()); //giving: Instance of 'Future<dynamic>'
          print("snapshot: $snapshot");
          if (snapshot.connectionState == ConnectionState.done) {
            print("Connected to FireB!");
            if (snapshot.hasData) {
              // FIGURE THIS
              print("Snapshot isn't null! ${snapshot.data}");

              UserDataModel userdata = snapshot.data as UserDataModel;
              print("User data from snapshot finally: $userdata");

              return Column(children: [
                Row(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                    child: Text("Support Contacts",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500)),
                  )
                ]),
                Row(children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                    child: Text(
                        "Emergency services, family contacts and office numbers!",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(0, 85, 85, 100))),
                  ))
                ]),
                SizedBox(height: 40),
                Row(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                    child: Text("OFFICE CONTACTS",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(29, 174, 239, 100))),
                  )
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("Kenya Main Office",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              decoration: TextDecoration.underline)))
                ]),
                SizedBox(height: 3),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("+254 767543123",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("Rwanda Main Office",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              decoration: TextDecoration.underline)))
                ]),
                SizedBox(height: 3),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("+250 767543123",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ]),
                SizedBox(height: 25),
                Row(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                    child: Text("FAMILY EMERGENCY CONTACTS",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(29, 174, 239, 100))),
                  )
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 10, 00),
                      child: Icon(Icons.person)),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 3, 45, 00),
                      child: Text(userdata.emergencyContact1,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ]),
                SizedBox(height: 7),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 10, 00),
                      child: Icon(Icons.person)),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 3, 45, 00),
                      child: Text(userdata.emergencyContact2,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ]),
                SizedBox(height: 7),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 10, 00),
                      child: Icon(Icons.person)),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 3, 45, 00),
                      child: Text(userdata.emergencyContact3,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ]),
                SizedBox(height: 25),
                Row(children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("EMERGENCY RESPONSE CONTACTS",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(29, 174, 239, 100))),
                    ),
                  )
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("Police",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              decoration: TextDecoration.underline)))
                ]),
                SizedBox(height: 3),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("+250 767543123",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("Ambulance Services",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              decoration: TextDecoration.underline)))
                ]),
                SizedBox(height: 3),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("+250 767543123",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ]),
                SizedBox(height: 9),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("Firefighters",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              decoration: TextDecoration.underline)))
                ]),
                SizedBox(height: 3),
                Row(children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text("+250 767543123",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)))
                ]),
                SizedBox(height: 10)
              ]);


            } else if (snapshot.hasError) {
              print("Snapshot.error returns: $snapshot.error");
              return Center(
                child: Text('Error is hasError: ${snapshot.hasError}'),
              );
            } else if (snapshot.isBlank == true) {
              return const Text("Blank");
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.red));
            }
          } else {
            return const Center(child: LinearProgressIndicator(color: Color.fromRGBO(197, 252, 128, 0.5)));
          }
        });
  }
}
