import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService extends GetxService {
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  Future<NotificationService> init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin!.initialize(initializationSettings);

    return this;
  }

  void showLocalNotification({
    required String title,
    required String body,
    required String payload,
  }) {
    const androidNotificationDetail = AndroidNotificationDetails(
      '0',
      '服務通知',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const iOSNotificationDetail = DarwinNotificationDetails();
    const notificationDetails = NotificationDetails(
      android: androidNotificationDetail,
      iOS: iOSNotificationDetail,
    );
    flutterLocalNotificationsPlugin!.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
