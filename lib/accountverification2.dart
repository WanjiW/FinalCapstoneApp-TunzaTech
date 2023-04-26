import 'package:flutter/material.dart';
import 'package:practice_project/accountverification1.dart';
import 'package:practice_project/userinformation.dart';

void main() => runApp(const AccountVerificationB());

class AccountVerificationB extends StatelessWidget {
  const AccountVerificationB ({super.key});

  static const String _title = 'AccountVerificationB';

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
              child: Text("This is to authenticate your account. Check your email!",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 85, 85, 100),
                      fontSize: 17,
                      fontStyle: FontStyle.italic))),
          SizedBox(height: 55),
          Row(children: [
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              width: 50,
              height: 50,
              padding: EdgeInsets.all(12.0),
              child: Text("X", textAlign: TextAlign.center, style: TextStyle(fontSize: 22),),
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              width: 50,
              height: 50,
              padding: EdgeInsets.all(12.0),
              child: Text("X", textAlign: TextAlign.center, style: TextStyle(fontSize: 22),),
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              width: 50,
              height: 50,
              padding: EdgeInsets.all(12.0),
              child: Text("X", textAlign: TextAlign.center, style: TextStyle(fontSize: 22),),
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              width: 50,
              height: 50,
              padding: EdgeInsets.all(12.0),
              child: Text("X", textAlign: TextAlign.center, style: TextStyle(fontSize: 22),),
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              width: 50,
              height: 50,
              padding: EdgeInsets.all(12.0),
              child: Text("X", textAlign: TextAlign.center, style: TextStyle(fontSize: 22),),
            ),
          ]),
          SizedBox(height: 50),
          GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ()));
              },
              child: Container(
                  width: 365,
                  child: Text("Resend", style: TextStyle(fontSize: 16, color: Colors.blueGrey, decoration: TextDecoration.underline), textAlign: TextAlign.left,)
              )),
          SizedBox(height: 7),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (AccountVerificationA())));
              },
              child: Container(
                  width: 365,
                  child: Text("Authenticate with phone number", style: TextStyle(fontSize: 16, color: Colors.blueGrey, decoration: TextDecoration.underline), textAlign: TextAlign.left,)
              )),
          SizedBox(height: 45),
          Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (UserInformation())));
                  },
                  child: Text(
                    "Next ->",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromRGBO(116, 199, 243, 100)), fixedSize: MaterialStateProperty.all<Size>(Size(320, 44))))),

        ]));

  }}