import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService{

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin
  = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    
    const AndroidInitializationSettings androidInitializationSettings
    = AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings darwinInitializationSettings
    = DarwinInitializationSettings();

    const InitializationSettings initializationSettings
    = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,);

    tz.initializeTimeZones();
  }

  void showNotificationAndroid(String title, String value) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channel_id', 'Channel Name',
        channelDescription: 'Channel Description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');

    int notificationId = 1;
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin
        .show(notificationId, title, value, notificationDetails, payload: 'Not present');

  }

  Future<void> showTimedNotification() async {
    int notificationId = 1;

    await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        "Title",
        "Description",
        tz.TZDateTime.now(tz.local).add(const Duration(days: 3)),
        const NotificationDetails(
            android: AndroidNotificationDetails("Reminder_channel", "Reminder Notifications")),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }


}

