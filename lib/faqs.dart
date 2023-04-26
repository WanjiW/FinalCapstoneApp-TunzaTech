import 'package:flutter/material.dart';

void main() => runApp(const FAQPage());

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  static const String _title = 'FAQPage';

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
          body: SingleChildScrollView(child: MyStatefulWidget()),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  // make many bools so they don't all open at the same time
  bool _isShow = false; // for the drop down faq text
  bool _isShow2 = false;
  bool _isShow3 = false;
  bool _isShow4 = false;
  bool _isShow5 = false;
  bool _isShow6 = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 0, 0, 00),
              child: Text("FAQs",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)))
        ]),
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 3, 0, 00),
              child: Text("Some of our most asked questions!",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(0, 85, 85, 100))))
        ]),
        SizedBox(height: 35),
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 5, 0, 00),
              child: Text("USAGE",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(29, 174, 239, 100))))
        ]),


        // FIRST FAQ
        SizedBox(height: 10),
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 5, 0, 00),
              child: Text("Lorem Ipsum dolor?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 100)))),
          SizedBox(width: 130),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow = !_isShow;
                });
              },

              // arrow down when info is showing
              child: Visibility(
                  visible: _isShow,
                  child: Icon(Icons.keyboard_arrow_down_rounded))),

          // arrow up when info isn't showing
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow = !_isShow;
                });
              },
              child: Visibility(
                  visible: !_isShow,
                  child: Icon(Icons.keyboard_arrow_up_rounded))),
        ]),
        SizedBox(height: 3),


        // to show the text based on them clicking the down arrow
        Visibility(
            visible: _isShow,
            child: Row(children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl. ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Color.fromRGBO(0, 85, 85, 100),
                              overflow: TextOverflow.clip))))
            ])),

        SizedBox(height: 15),
        // SECOND FAQ
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 5, 0, 00),
              child: Text("Lorem Ipsum dolor?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 100)))),
          SizedBox(width: 130),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow2 = !_isShow2;
                });
              },
              child: Visibility(
                  visible: _isShow2,
                  child: Icon(Icons.keyboard_arrow_down_rounded))),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow2 = !_isShow2;
                });
              },
              child: Visibility(
                  visible: !_isShow2,
                  child: Icon(Icons.keyboard_arrow_up_rounded))),
        ]),
        SizedBox(height: 3),
        // text
        Visibility(
            visible: _isShow2,
            child: Row(children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl. ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Color.fromRGBO(0, 85, 85, 100),
                              overflow: TextOverflow.clip))))
            ])),

        SizedBox(height: 15),
        // THIRD FAQ
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 5, 0, 00),
              child: Text("Lorem Ipsum dolor?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 100)))),
          SizedBox(width: 130),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow3 = !_isShow3;
                });
              },
              child: Visibility(
                  visible: _isShow3,
                  child: Icon(Icons.keyboard_arrow_down_rounded))),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow3 = !_isShow3;
                });
              },
              child: Visibility(
                  visible: !_isShow3,
                  child: Icon(Icons.keyboard_arrow_up_rounded))),
        ]),
        SizedBox(height: 3),
        // text
        Visibility(
            visible: _isShow3,
            child: Row(children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl. ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Color.fromRGBO(0, 85, 85, 100),
                              overflow: TextOverflow.clip))))
            ])),



        SizedBox(height: 35),
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 5, 0, 00),
              child: Text("FEATURES",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(29, 174, 239, 100))))
        ]),

        SizedBox(height: 15),
        // FOURTH FAQ
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 5, 0, 00),
              child: Text("Lorem Ipsum dolor?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 100)))),
          SizedBox(width: 130),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow4 = !_isShow4;
                });
              },
              child: Visibility(
                  visible: _isShow4,
                  child: Icon(Icons.keyboard_arrow_down_rounded))),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow4 = !_isShow4;
                });
              },
              child: Visibility(
                  visible: !_isShow4,
                  child: Icon(Icons.keyboard_arrow_up_rounded))),
        ]),
        SizedBox(height: 3),
        // text
        Visibility(
            visible: _isShow4,
            child: Row(children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl. ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Color.fromRGBO(0, 85, 85, 100),
                              overflow: TextOverflow.clip))))
            ])),


        SizedBox(height: 15),
        // FIFTH FAQ
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 5, 0, 00),
              child: Text("Lorem Ipsum dolor?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 100)))),
          SizedBox(width: 130),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow5 = !_isShow5;
                });
              },
              child: Visibility(
                  visible: _isShow5,
                  child: Icon(Icons.keyboard_arrow_down_rounded))),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow5 = !_isShow5;
                });
              },
              child: Visibility(
                  visible: !_isShow5,
                  child: Icon(Icons.keyboard_arrow_up_rounded))),
        ]),

        SizedBox(height: 3),
        // text
        Visibility(
            visible: _isShow5,
            child: Row(children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl. ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Color.fromRGBO(0, 85, 85, 100),
                              overflow: TextOverflow.clip))))
            ])),


        SizedBox(height: 15),
        // SIXTH FAQ
        Row(children: [
          Container(
              padding: EdgeInsets.fromLTRB(45, 5, 0, 00),
              child: Text("Lorem Ipsum dolor?",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 100)))),
          SizedBox(width: 130),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow6 = !_isShow6;
                });
              },
              child: Visibility(
                  visible: _isShow6,
                  child: Icon(Icons.keyboard_arrow_down_rounded))),
          GestureDetector(
              onTap: () {
                setState(() {
                  // the ! changes it from false to true
                  _isShow6 = !_isShow6;
                });
              },
              child: Visibility(
                  visible: !_isShow6,
                  child: Icon(Icons.keyboard_arrow_up_rounded))),
        ]),

        SizedBox(height: 3),
        // text
        Visibility(
            visible: _isShow6,
            child: Row(children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(45, 3, 45, 00),
                      child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Gravida ullamcorper dolor amet quis. Feugiat curabitur sollicitudin sapien neque pulvinar egestas. Tempus dolor aliquam amet faucibus. Varius tellus porttitor egestas lectus dignissim rhoncus. Dictum proin scelerisque lectus dolor in facilisis gravida in nisl. ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Color.fromRGBO(0, 85, 85, 100),
                              overflow: TextOverflow.clip))))
            ])),
        SizedBox(height: 20)


      ],
    );
  }
}
