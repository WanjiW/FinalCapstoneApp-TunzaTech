import 'package:flutter/material.dart';

void main() => runApp(const PrivacyPolicyPage());

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  static const String _title = 'PrivacyPolicyPage';

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
    return Column(
        children:[
          Row(children: [ Container(
            padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
            child: Text("Privacy Policy",  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
          )]),
          Row(children: [ Container(
            padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
            child: Text("Last Updated: 3rd March 2021",  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, color: Color.fromRGBO(0, 85, 85, 100))),
          )]),

          SizedBox(height: 30),
          //Section A
          Row(children: [ Container(
            padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
            child: Text("SECTION A",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(29, 174, 239, 100))),
          )]),
          Row(children: [
            Expanded(child: Container(
            padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
            child: Text("Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl.",  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black)),
          ))]),

          SizedBox(height: 30),
          //Section B
          Row(children: [ Container(
            padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
            child: Text("SECTION B",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(29, 174, 239, 100))),
          )]),
          Row(children: [
            Expanded(child: Container(
              padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
              child: Text("Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. \n"
                  "\n      a. Varius tellus porttitor egestas lectus dignissim rhoncus - dictum proin scelerisque lectus dolor in facilisis \n"
                  "\n      b. gravida in nisl. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin Varius tellus porttitor egestas lectus dignissim rhoncus - dictum proin",  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black)),
            ))]),

          SizedBox(height: 30),
          //Section C
          Row(children: [ Container(
            padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
            child: Text("SECTION C",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(29, 174, 239, 100))),
          )]),
          Row(children: [
            Expanded(child: Container(
              padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
              child: Text("Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl.",  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black)),
            ))]),

          SizedBox(height: 30),
          //Section D
          Row(children: [ Container(
            padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
            child: Text("SECTION D",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color.fromRGBO(29, 174, 239, 100))),
          )]),
          Row(children: [
            Expanded(child: Container(
              padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
              child: Text("Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl.",  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black)),
            ))]),

          SizedBox(height: 30)


        ]);
  }
}
