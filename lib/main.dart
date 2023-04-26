import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:practice_project/authentication_repo.dart';
import 'package:practice_project/firebase_options.dart';
import 'package:practice_project/onboarding1.dart';
import 'package:practice_project/signin.dart';
import 'package:practice_project/signup-mpdcode.dart';
import 'package:practice_project/signup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(SplashPage());
  // runApp(GetMaterialApp(home: Scaffold()));
}

class SplashPage extends StatelessWidget {
  // const SplashPage({super.key});
  const SplashPage();

  static const String _title = 'Splash Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: Center(
          child:MyStatelessWidget(),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  // const MyStatelessWidget({super.key});
  const MyStatelessWidget();


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      height: 400,
      width: 300,
      decoration: BoxDecoration(
          // color: Colors.black.withOpacity(0.4),
          image: DecorationImage(
            filterQuality: FilterQuality.medium,
              image: AssetImage("assets/images/gukacucu.jpg"),
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.60), BlendMode.darken),
              fit: BoxFit.cover)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 350),
            Text("TUNZATECH",
                style: TextStyle(
                    fontSize: 52,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Text("taking care of the people who take care of us",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(29, 174, 239, 30),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center),
            SizedBox(height: 55),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (TutorialPageA())));
                },
                child: Text("Sign Up", style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                    // remember: low opacity = less transparent!
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(11, 19, 43, 10)),
                    fixedSize: MaterialStateProperty.all<Size>(Size(235, 44)))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (SignIn())));
                },
                child: Text("Sign In", style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(116, 199, 243, 10)),
                    fixedSize: MaterialStateProperty.all<Size>(Size(235, 44))))
          ]),
    );
  }
}
