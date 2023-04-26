import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:practice_project/importantcontacts.dart';
import 'package:practice_project/profile.dart';
import 'package:practice_project/bottomnavigationbar.dart';
import 'package:practice_project/pwdinfo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'monitorsensordata.dart';
// import 'notificationcontroller.dart';





void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String _title = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  late SensorMonitor sensorController;

  @override
  void initState() {
    super.initState();
    sensorController = Get.put(SensorMonitor());
    sensorController.startDistanceMonitoring();
  }

  void _onItemTapped(int index) {}

  void dispose() {
    // Dispose of _formKeyB when the widget is removed from the tree


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: HomePage._title,
      // initialRoute: '/homepage',
      routes: {
        '/pwdinfo': (context) => PwDInfoPage(),
        '/homepage': (context) => Scaffold(
              body: SingleChildScrollView(child: MyStatefulWidget()),
              bottomNavigationBar: MyBottomNavigationBar(
                  currentIndex: _currentIndex, onTap: _onItemTapped),
            ),
        '/importantcontacts': (context) => ImportantContactsPage(),
      },
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: SingleChildScrollView(child: MyStatefulWidget()),
        bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: _currentIndex, onTap: _onItemTapped),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // code from the IOT device will go here
  // default is false = no alert
  bool _alertCaregiverOrientation = false;
  bool _alertCaregiverLocation = false;
  final fbdbauth = FirebaseAuth.instance;


  double distance = 0;
  int fallBool = 0;
  int ecg = 0;

  final sensorController = Get.put(SensorMonitor());


  @override
  Widget build(BuildContext context) {


    Stream<int?> ecgData = sensorController.startECGMonitoring() as Stream<int?>;
    Stream<int?> fallData = sensorController.startFallMonitoring() as Stream<int?>; //false
    Stream<double?> distData = sensorController.startDistanceMonitoring() as Stream<double?>;


    return StreamBuilder(
      stream: rxdart.Rx.combineLatest3(      // lets you listen to multiple streams !!!
          fallData as Stream<int?>, distData as Stream<double?>, ecgData as Stream<int?>, (fall, dist, ecg) => [fall, dist, ecg]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){   // dynamic!

        if (snapshot.hasData){

          List sensorData = snapshot.data!;

          distance = sensorData[1];
          fallBool = sensorData[0];
          ecg = sensorData[2];

          if (distance > 20){
            _alertCaregiverLocation = true;
          } else {
            _alertCaregiverLocation = false;
          }

          if(fallBool == 1){
            _alertCaregiverOrientation = true;
          } else {
            _alertCaregiverOrientation = false;
            // NotificationController.init();
            // NotificationController.showNotification('My Notification', 'This is a test notification! Fall is 0');
          }

          return Container(
            color: Color.fromRGBO(146, 211, 245, 0.9),
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => (ProfilePage())));
                    },
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            width: 80,
                            height: 140,
                            child: Icon(Icons.person_rounded,
                                color: Colors.black, size: 33)))),
                SizedBox(height: 8),
                Container(
                    width: 365,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(CupertinoIcons.sparkles,
                            color: Colors.yellow, size: 45))),

                SizedBox(height: 10),
                Container(
                    width: 365,
                    child: Text("Remember: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600))),
                Container(
                    width: 365,
                    child: Text(
                        "The simple act of caring is heroic", //https://www.thehealthy.com/healthcare/caregiving/caregiver-quotes/
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic))),
                // SizedBox(child: Text("")),
                SizedBox(height: 5),
                Container(
                  width: 365,
                  child: Text("- Edward Albert, American actor",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Colors.yellow)),
                ),
                SizedBox(height: 5),
                // Container(
                //     width: 365,
                //     child: Text(
                //         "Latest distance val: ${sensorController.distanceData}",
                //         style: TextStyle(
                //             color: Colors.red, fontWeight: FontWeight.bold)
                //     )
                // ),

// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                // part that reacts to the monitoring of the sensor data
                SizedBox(height: 65),
                Container(
                  height: 480,
                  width: 800,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      // orientation

                      SizedBox(height: 50),
                      Visibility(
                          visible: !_alertCaregiverOrientation,
                          child: Container(
                              height: 100,
                              width: 365,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(203, 243, 152, 0.3),
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(8),
                                      left: Radius.circular(8))),
                              child: Row(children: [
                                GestureDetector(
                                    onDoubleTap: () {
                                      setState(() {
                                        // the ! changes it from false to true
                                        _alertCaregiverOrientation = !_alertCaregiverOrientation;
                                      });
                                    },
                                    child: Container(
                                        width: 65,
                                        child: Icon(Icons.man,
                                            color: Colors.black, size: 40))),
                                Container(
                                    child: Column(children: [
                                      SizedBox(height: 26),
                                      Text("ORIENTATION",
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.w500)),
                                      SizedBox(height: 5),
                                      Text("Upright                 ",
                                          style: TextStyle(
                                              fontSize: 15, fontWeight: FontWeight.w300))
                                    ])),
                                Container(
                                  padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                                  child: Icon(Icons.check_box_rounded,
                                      color: Colors.black, size: 50),
                                )
                              ]))),

                      //ORIENTATION ALERT!
                      Visibility(
                        visible: _alertCaregiverOrientation,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(70, 5, 00, 00),
                            height: 100,
                            width: 365,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(239, 0, 0, 0.7),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(8),
                                    left: Radius.circular(8))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(children: [
                                    Container(
                                        padding:
                                        EdgeInsets.fromLTRB(60, 0, 00, 00),
                                        child: Icon(Icons.man,
                                            color: Colors.white, size: 40)),
                                    Container(
                                        child: Icon(Icons.dangerous_outlined,
                                            color: Colors.white, size: 40)),
                                  ]),
                                  Row(children: [
                                    Container(
                                        padding: EdgeInsets.fromLTRB(30, 5, 00, 00),
                                        child: Text("!!! FALL DETECTED !!!",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white))),
                                  ]),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 3, 88, 00),
                                    child: Text(
                                      "Latest distance: ${sensorController.dData} meters away",
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)
                                  ),)
                                ])),
                      ),

// ------------------------------------------------------------------------------------------------------------------------------------

                      // LOCATION
                      SizedBox(height: 30),
                      Visibility(
                          visible: !_alertCaregiverLocation,
                          child: Container(
                              height: 100,
                              width: 365,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(203, 243, 152, 0.3),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(children: [
                                Container(
                                    width: 65,
                                    child: Icon(Icons.location_history,
                                        color: Colors.black, size: 40)),
                                Container(
                                    child: Column(children: [
                                      SizedBox(height: 26),
                                      Container(
                                          width: 200,
                                          child: Text("LOCATION",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500))),
                                      SizedBox(height: 5),
                                      Container(
                                          width: 200,
                                          child: Text("Within Safe Zone \n${distance} meters away",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300)))
                                    ])),

                                //NB: add map plugin here!
                                Container(
                                    width: 100,
                                    height: 365,
                                    child: Image.asset('assets/images/map.jpg')),
                              ]))),

                      // LOCATION ALERT
                      // SizedBox(height: 30),
                      Visibility(
                        visible: _alertCaregiverLocation,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(45, 5, 00, 00),
                            height: 100,
                            width: 365,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(239, 0, 0, 0.7),
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(8),
                                    left: Radius.circular(8))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(children: [
                                    Container(
                                        padding:
                                        EdgeInsets.fromLTRB(90, 0, 00, 00),
                                        child: Icon(Icons.location_history,
                                            color: Colors.white, size: 40)),
                                    Container(
                                        child: Icon(Icons.dangerous_outlined,
                                            color: Colors.white, size: 40)),
                                  ]),
                                  Row(children: [
                                    Container(
                                        padding: EdgeInsets.fromLTRB(0, 5, 20, 00),
                                        child: Text(
                                            "OUTSIDE SAFE ZONE: $distance METERS AWAY!",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white)))
                                  ])
                                ])),
                      ),

// --------------------------------------------------------------------------------------------------------------------------------------
                      // HEART RATE
                      SizedBox(height: 30),
                      Container(
                          height: 100,
                          width: 365,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(203, 243, 152, 0.3),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(children: [
                            Container(
                                width: 65,
                                child: Icon(Icons.monitor_heart_rounded,
                                    color: Colors.black, size: 40)),
                            Container(
                                child: Column(children: [
                                  SizedBox(height: 26),
                                  Container(
                                      width: 200,
                                      child: Text("ECG VALUE",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500))),
                                  SizedBox(height: 5),
                                  Container(
                                      width: 200,
                                      child: Text("Monitoring...",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300)))
                                ])),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                child: Text("${ecg}",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(width: 5),
                            // Container(
                            //     child: Text("bpm",
                            //         style: TextStyle(
                            //             fontSize: 18,
                            //             fontWeight: FontWeight.w300)))
                          ])),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          print("error: ${snapshot.error}");
          return CircularProgressIndicator();
//           return Container(
//             color: Color.fromRGBO(146, 211, 245, 0.9),
//             child: Column(
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => (ProfilePage())));
//                     },
//                     child: Align(
//                         alignment: Alignment.bottomRight,
//                         child: Container(
//                             width: 80,
//                             height: 140,
//                             child: Icon(Icons.person_rounded,
//                                 color: Colors.black, size: 33)))),
//                 SizedBox(height: 8),
//                 Container(
//                     width: 365,
//                     child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Icon(CupertinoIcons.sparkles,
//                             color: Colors.yellow, size: 45))),
//
//                 SizedBox(height: 10),
//                 Container(
//                     width: 365,
//                     child: Text("Remember: ",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600))),
//                 Container(
//                     width: 365,
//                     child: Text(
//                         "The simple act of caring is heroic", //https://www.thehealthy.com/healthcare/caregiving/caregiver-quotes/
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                             fontStyle: FontStyle.italic))),
//                 // SizedBox(child: Text("")),
//                 SizedBox(height: 5),
//                 Container(
//                   width: 365,
//                   child: Text("- Edward Albert, American actor",
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w400,
//                           fontStyle: FontStyle.normal,
//                           color: Colors.yellow)),
//                 ),
//                 SizedBox(height: 5),
//                 // Container(
//                 //     width: 365,
//                 //     child: Text(
//                 //         "Latest distance val: ${sensorController.distanceData}",
//                 //         style: TextStyle(
//                 //             color: Colors.red, fontWeight: FontWeight.bold)
//                 //     )
//                 // ),
//
// // ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// // ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
//                 // part that reacts to the monitoring of the sensor data
//                 SizedBox(height: 65),
//                 Container(
//                   height: 480,
//                   width: 800,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(8), topLeft: Radius.circular(8)),
//                   ),
//                   child: Column(
//                     children: [
//                       // orientation
//
//                       SizedBox(height: 50),
//                       Visibility(
//                           visible: !_alertCaregiverOrientation,
//                           child: Container(
//                               height: 100,
//                               width: 365,
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(203, 243, 152, 0.3),
//                                   borderRadius: BorderRadius.horizontal(
//                                       right: Radius.circular(8),
//                                       left: Radius.circular(8))),
//                               child: Row(children: [
//                                 GestureDetector(
//                                     onDoubleTap: () {
//                                       setState(() {
//                                         // the ! changes it from false to true
//                                         _alertCaregiverOrientation = !_alertCaregiverOrientation;
//                                       });
//                                     },
//                                     child: Container(
//                                         width: 65,
//                                         child: Icon(Icons.man,
//                                             color: Colors.black, size: 40))),
//                                 Container(
//                                     child: Column(children: [
//                                       SizedBox(height: 26),
//                                       Text("ORIENTATION",
//                                           style: TextStyle(
//                                               fontSize: 18, fontWeight: FontWeight.w500)),
//                                       SizedBox(height: 5),
//                                       Text("Upright                 ",
//                                           style: TextStyle(
//                                               fontSize: 15, fontWeight: FontWeight.w300))
//                                     ])),
//                                 Container(
//                                   padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
//                                   child: Icon(Icons.check_box_rounded,
//                                       color: Colors.black, size: 50),
//                                 )
//                               ]))),
//
//                       //ORIENTATION ALERT!
//                       Visibility(
//                         visible: _alertCaregiverOrientation,
//                         child: Container(
//                             padding: EdgeInsets.fromLTRB(70, 5, 00, 00),
//                             height: 100,
//                             width: 365,
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(239, 0, 0, 0.7),
//                                 borderRadius: BorderRadius.horizontal(
//                                     right: Radius.circular(8),
//                                     left: Radius.circular(8))),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(children: [
//                                     Container(
//                                         padding:
//                                         EdgeInsets.fromLTRB(60, 0, 00, 00),
//                                         child: Icon(Icons.man,
//                                             color: Colors.white, size: 40)),
//                                     Container(
//                                         child: Icon(Icons.dangerous_outlined,
//                                             color: Colors.white, size: 40)),
//                                   ]),
//                                   Row(children: [
//                                     Container(
//                                         padding: EdgeInsets.fromLTRB(0, 5, 00, 00),
//                                         child: Text("CHRISTOPHER HAS FALLEN DOWN",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.white))),
//                                   ]),
//                                   Container(
//                                     padding: EdgeInsets.fromLTRB(0, 3, 60, 00),
//                                     child: Text(
//                                         "Latest distance: ${sensorController.dData} meters away",
//                                         style: TextStyle(
//                                             color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)
//                                     ),)
//                                 ])),
//                       ),
//
// // ------------------------------------------------------------------------------------------------------------------------------------
//
//                       // LOCATION
//                       SizedBox(height: 30),
//                       Visibility(
//                           visible: !_alertCaregiverLocation,
//                           child: Container(
//                               height: 100,
//                               width: 365,
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(203, 243, 152, 0.3),
//                                   borderRadius: BorderRadius.circular(8)),
//                               child: Row(children: [
//                                 Container(
//                                     width: 65,
//                                     child: Icon(Icons.location_history,
//                                         color: Colors.black, size: 40)),
//                                 Container(
//                                     child: Column(children: [
//                                       SizedBox(height: 26),
//                                       Container(
//                                           width: 200,
//                                           child: Text("LOCATION",
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.w500))),
//                                       SizedBox(height: 5),
//                                       Container(
//                                           width: 200,
//                                           child: Text("Within Safe Zone \n${distance} meters away",
//                                               style: TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w300)))
//                                     ])),
//
//                                 //NB: add map plugin here!
//                                 Container(
//                                     width: 100,
//                                     height: 365,
//                                     child: Image.asset('assets/images/map.jpg')),
//                               ]))),
//
//                       // LOCATION ALERT
//                       // SizedBox(height: 30),
//                       Visibility(
//                         visible: _alertCaregiverLocation,
//                         child: Container(
//                             padding: EdgeInsets.fromLTRB(45, 5, 00, 00),
//                             height: 100,
//                             width: 365,
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(239, 0, 0, 0.7),
//                                 borderRadius: BorderRadius.horizontal(
//                                     right: Radius.circular(8),
//                                     left: Radius.circular(8))),
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Row(children: [
//                                     Container(
//                                         padding:
//                                         EdgeInsets.fromLTRB(90, 0, 00, 00),
//                                         child: Icon(Icons.location_history,
//                                             color: Colors.white, size: 40)),
//                                     Container(
//                                         child: Icon(Icons.dangerous_outlined,
//                                             color: Colors.white, size: 40)),
//                                   ]),
//                                   Row(children: [
//                                     Container(
//                                         padding: EdgeInsets.fromLTRB(20, 5, 00, 00),
//                                         child: Text(
//                                             "CHRISTOPHER IS $distance METERS AWAY!",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Colors.white)))
//                                   ])
//                                 ])),
//                       ),
//
// // --------------------------------------------------------------------------------------------------------------------------------------
//                       // HEART RATE
//                       SizedBox(height: 30),
//                       Container(
//                           height: 100,
//                           width: 365,
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(203, 243, 152, 0.3),
//                               borderRadius: BorderRadius.circular(8)),
//                           child: Row(children: [
//                             Container(
//                                 width: 65,
//                                 child: Icon(Icons.monitor_heart_rounded,
//                                     color: Colors.black, size: 40)),
//                             Container(
//                                 child: Column(children: [
//                                   SizedBox(height: 26),
//                                   Container(
//                                       width: 200,
//                                       child: Text("ECG VALUE",
//                                           style: TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w500))),
//                                   SizedBox(height: 5),
//                                   Container(
//                                       width: 200,
//                                       child: Text("Monitoring...",
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w300)))
//                                 ])),
//                             Container(
//                                 padding: EdgeInsets.fromLTRB(25, 5, 0, 0),
//                                 child: Text("$ecg",
//                                     style: TextStyle(
//                                         fontSize: 35,
//                                         fontWeight: FontWeight.bold))),
//                             SizedBox(width: 5),
//                             // Container(
//                             //     child: Text("bpm",
//                             //         style: TextStyle(
//                             //             fontSize: 18,
//                             //             fontWeight: FontWeight.w300)))
//                           ])),
//
//                       // HEART RATE ALERT
//                       // Visibility(
//                       //   visible: _alertCaregiverECG,
//                       //   child: Container(
//                       //       padding: EdgeInsets.fromLTRB(45, 5, 00, 00),
//                       //       height: 100,
//                       //       width: 365,
//                       //       decoration: BoxDecoration(
//                       //           color: Color.fromRGBO(239, 0, 0, 0.7),
//                       //           borderRadius: BorderRadius.horizontal(
//                       //               right: Radius.circular(8),
//                       //               left: Radius.circular(8))),
//                       //       child: Column(
//                       //           mainAxisAlignment: MainAxisAlignment.center,
//                       //           children: [
//                       //             Row(children: [
//                       //               GestureDetector(
//                       //                   onDoubleTap: () {
//                       //                     setState(() {
//                       //                       // the ! changes it from false to true
//                       //                       _alertCaregiverECG = !_alertCaregiverECG;
//                       //                     });
//                       //                   },
//                       //                   child: Container(
//                       //                       padding:
//                       //                       EdgeInsets.fromLTRB(90, 0, 00, 00),
//                       //                       child: Icon(Icons.monitor_heart_rounded,
//                       //                           color: Colors.white, size: 40))),
//                       //               Container(
//                       //                   child: Icon(Icons.dangerous_outlined,
//                       //                       color: Colors.white, size: 40)),
//                       //             ]),
//                       //             Row(children: [
//                       //               Container(
//                       //                   padding: EdgeInsets.fromLTRB(0, 5, 00, 00),
//                       //                   child: Text(
//                       //                       "CHRISTOPHER'S HEART RATE IS HIGH",
//                       //                       style: TextStyle(
//                       //                           fontSize: 15,
//                       //                           fontWeight: FontWeight.w500,
//                       //                           color: Colors.white)))
//                       //             ])
//                       //           ])),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );

        }
      },


    );
  }
}
