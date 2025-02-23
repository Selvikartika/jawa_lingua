import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifikasi Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  // Inisialisasi notifikasi
  Future<void> initializeNotifications() async {
    var androidInitialization = AndroidInitializationSettings('app_icon');
    var initializationSettings = InitializationSettings(
      android: androidInitialization,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Fungsi untuk menampilkan notifikasi
  Future<void> showNotification() async {
    var androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
    var generalNotificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // ID notifikasi
      'Notifikasi Baru', // Judul
      'Ini adalah notifikasi yang muncul setelah tombol ditekan!', // Deskripsi
      generalNotificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi Flutter'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showNotification(); // Tampilkan notifikasi ketika tombol ditekan
          },
          child: Text('Tampilkan Notifikasi'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
