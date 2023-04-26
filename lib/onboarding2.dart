import 'package:flutter/material.dart';
import 'package:practice_project/accountverification1.dart';
import 'package:practice_project/homepage.dart';
import 'package:practice_project/signin.dart';
import 'package:practice_project/signup.dart';

void main() => runApp(const TutorialPageB());

class TutorialPageB extends StatelessWidget {
  const TutorialPageB ({super.key});

  static const String _title = 'TutorialPageA';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        height: 400,
        width: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/onboarding2.jpeg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(width: 0, child: Text("Skip", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            SizedBox(height: 250),
            Container(
                width: 365,
                child: Text(
                    "Lorem Ipsum",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white))),
            SizedBox(height: 20),
            Container(
                width: 365,
                child: Text(
                    "Dolor sit amet consectetur. Fermentum sit posuere sed vitae. Ultrices tincidunt non magnis scelerisque ullamcorper dolor purus imperdiet sit, scelerisque ullamcorper dolor purus imperdiet sit scelerisque ullamcorper dolor purus imperdiet sit",
                    style: TextStyle(fontSize: 24, color: Colors.white))),
            SizedBox(height: 90),
            Container(
                height: 45,
                width: 180,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (SignUp())));
                }, child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Color.fromRGBO(116, 199, 243, 100)))))

          ],
        ));
  }
}
