import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice_project/profile.dart';
import 'package:practice_project/profilecontroller.dart';
import 'package:practice_project/usermodel.dart';
import 'package:practice_project/validation.dart';

void main() => runApp(const AccountSettingsPage());

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  static const String _title = 'AccountSettingsPage';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
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
          body: SingleChildScrollView (child: MyStatefulWidget()),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);


  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final controller = Get.put(ProfileController());

  final _formKeyD = GlobalKey<FormState>();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  late Future future;

  @override
  void initState() {
    super.initState();
    future = controller.getUserData();
  }

  @override
  void dispose() {
    // Dispose of _formKeyB when the widget is removed from the tree
    _formKeyD.currentState?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            UserModel user = snapshot.data as UserModel;

            fullName.text = user.fullName;
            email.text = user.email;
            phoneNo.text = user.phoneNo;
            password.text = user.password;

            return Form(
                key: _formKeyD,
                child: Container(
                  width: 500,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 365,
                          padding: EdgeInsets.fromLTRB(20, 3, 45, 00),
                          child: Text("Personal \nInformation",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          width: 365,
                          padding: EdgeInsets.fromLTRB(20, 3, 45, 00),
                          child: Text("Update your personal details here",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromRGBO(0, 85, 85, 100))),
                        ),
                        SizedBox(height: 50), // controller and initial value cannot be used at the same time!
                        Container(
                          width: 365,
                          padding: EdgeInsets.fromLTRB(20, 3, 15, 0),
                          child: TextFormField(
                            controller: fullName,
                            autofocus: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Full Name",
                                suffixIcon: Icon(Icons.edit)),
                            validator: textInputValidator,
                            onSaved: (value){
                              fullName == value;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 365,
                          padding: EdgeInsets.fromLTRB(20, 3, 15, 0),
                          child: TextFormField(
                            controller: email,
                            autofocus: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Email"),
                                suffixIcon: Icon(Icons.edit)
                            ),
                            validator: emailValidator,
                            onSaved: (value){
                              email == value;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 365,
                          padding: EdgeInsets.fromLTRB(20, 3, 15, 0),
                          child: TextFormField(
                            controller: phoneNo,
                            autofocus: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Phone Number"),
                                suffixIcon: Icon(Icons.edit)
                            ),
                            validator: phoneNumberValidator,
                            onSaved: (value){
                              phoneNo == value;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 365,
                          padding: EdgeInsets.fromLTRB(20, 3, 15, 0),
                          child: TextFormField(
                            controller: password,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Password"),
                                suffixIcon: Icon(Icons.edit)
                            ),
                            validator: passwordValidator,
                            // tru set state here
                            onSaved: (value){
                              password == value;
                            },
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          // width: 365,
                          child: ElevatedButton(
                              onPressed: () async {
                                  if (_formKeyD.currentState != null && _formKeyD.currentState!.validate()) {

                                    final updatedUser = UserModel(
                                      id: user.id,
                                      fullName: fullName.text.trim(),
                                      email: email.text.trim(),
                                      phoneNo: phoneNo.text.trim(),
                                      password: password.text.trim(),
                                    );

                                    await controller.updateUserDetails(updatedUser);
                                    print(controller.updateUserDetails(updatedUser));

                                    // setState(() {
                                    //   UserModel user = updatedUser;
                                    //   print("New user data: $user");
                                    // });


                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('User Details Updated :)')),
                                    );
                                    if (SnackbarController.isSnackbarBeingShown){
                                      Get.to(() => ProfilePage());
                                    }
                                  }},
                              child: Text(
                                "Save Changes",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color.fromRGBO(116, 199, 243, 100)),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(240, 44)))),
                        ),
                      ]),
                ));
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: Text("Something went wrong"));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
