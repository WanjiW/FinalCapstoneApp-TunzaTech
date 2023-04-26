import 'package:flutter/material.dart';

void main() => runApp(const ChangePasswordPage());

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  static const String _title = 'ChangePasswordPage';

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
          body: SingleChildScrollView(child: MyStatelessWidget()),
        ));
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(children: [
        Container(
          padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
          child: Text("Reset Password",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
        )
      ]),
      Row(children: [
        Container(
          padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
          child: Text("Update App Password",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(0, 85, 85, 100))),
        )
      ]),
      SizedBox(height: 40),
      Row(children: [
        Container(
            padding: EdgeInsets.fromLTRB(45, 5, 0, 0),
            width: 365,
            child: const TextField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                labelText: 'Enter Current Password', // GET FROM DB
              ),
            )),
      ]),

      SizedBox(height: 15),
      Row(children: [
        Container(
            padding: EdgeInsets.fromLTRB(45, 5, 0, 0),
            width: 365,
            child: const TextField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                labelText: 'Enter New Password', // GET FROM DB
              ),
            )),
      ]),

      SizedBox(height: 15),
      Row(children: [
        Container(
            padding: EdgeInsets.fromLTRB(45, 5, 0, 0),
            width: 365,
            child: const TextField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(),
                labelText: 'Confirm New Password', // GET FROM DB
              ),
            )),
      ]),

      SizedBox(height: 40),
      ElevatedButton(
            onPressed: () {
              // add save new info to db, but after a confirming alert dialogue
            },
            child: Text(
              "Save New Password",
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Color.fromRGBO(116, 199, 243, 100)), fixedSize: MaterialStateProperty.all<Size>(Size(240, 44)))),





    ]);
  }
}
