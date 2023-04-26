// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationController {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     'This channel is used for important notifications.',
//     importance: Importance.high,
//     playSound: true,
//   );
//   static const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('app_icon');
//   static const IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
//   static const InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//   static Future<void> init() async {
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//     await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
//   }
//
//   static Future<void> showNotification(String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'high_importance_notification',
//       'High Importance Notification',
//       'This channel is used for important notifications.',
//       importance: Importance.high,
//       playSound: true,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'Default_Sound',
//     );
//   }
// }
