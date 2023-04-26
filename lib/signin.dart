import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:practice_project/signup.dart';
import 'package:practice_project/signupcontroller.dart';

void main() => runApp(const SignIn());

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  static const String _title = 'SignIn';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final controller = Get.put(SignUpController());
  final _formKeyB = GlobalKey<FormState>();
  late bool _hidePswd = true;


  @override
  void dispose() {
    // Dispose of _formKeyB when the widget is removed from the tree
    _formKeyB.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Form(
        key: _formKeyB,
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Container(
                    width: 365,
                    child: Text("Sign In",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 10),
                Container(
                    width: 365,
                    child: Text("Welcome back!",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 85, 85, 100),
                            fontSize: 20,
                            fontStyle: FontStyle.italic))),
                SizedBox(height: 55),
                Container(width: 365, child: TextField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                )),
                // SizedBox(height: 20),
                // Container(width: 365, child: TextField(
                //   controller: controller.password,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Password',
                //   ),
                // )),
                SizedBox(height: 20),
                Container(width: 365, child: TextField(
                  controller: controller.password,
                  obscureText: _hidePswd,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: (){
                        print("tapping");
                        setState(() {
                          _hidePswd = !_hidePswd;
                        });
                      },
                      child: Icon(Icons.remove_red_eye_rounded),
                    ),
                  ),
                )),
                SizedBox(height: 15),
                // Container(
                //     width: 365,
                //     child: Divider(
                //       color: Colors.black26,
                //     )),
                SizedBox(height: 15),
                Container(
                  // height: 45,
                  // width: 180,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKeyB.currentState != null &&
                              _formKeyB.currentState!.validate()) {
                            // here, add validators: after validation, so valid email and password, all field filled
                            SignUpController.instance.loginExistingUser(
                                controller.email.text.trim(),
                                controller.password.text.trim());
                          } else {
                            SnackBar(content: Text("Email or password is incorrect - try again!"));
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                                116, 199, 243, 100)),
                            fixedSize: MaterialStateProperty.all<Size>(Size(
                                365, 44))))),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => (SignUp())));
                    },
                    child: Container(
                        child: RichText(text: TextSpan(children: <TextSpan>[
                          TextSpan(text: "Don't have an account?",
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(96, 91, 91, 100))),
                          TextSpan(text: " Sign Up here!",
                              style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(116, 199, 243, 100)))
                        ],
                        ))
                    )),

              ],
            )
        ),
      );

    // } else if (snapshot.hasError) {
    //   return Center(child: Text(snapshot.error.toString()));
    // } else {
    //   return Center(child: Text("Something went wrong"));
    // }
    // } else {
    //   return const Center(child: CircularProgressIndicator());
    // }
    //   },

    // );
}
}
