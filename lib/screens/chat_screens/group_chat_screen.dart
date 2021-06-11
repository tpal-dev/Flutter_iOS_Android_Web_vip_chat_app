import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:vip_chat_app/screens/chat_screens/chat_view.dart';
import 'package:vip_chat_app/services/auth.dart';
import 'package:vip_chat_app/utilities/constants.dart';
import 'package:vip_chat_app/utilities/constants_firebase.dart';
import 'package:vip_chat_app/widgets/customized_animated_drawer.dart';

class GroupChatScreen extends StatefulWidget {
  static const String id = 'group_chat_screen';
  const GroupChatScreen({Key key, @required this.auth}) : super(key: key);

  final AuthBase auth;

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  @override
  void initState() {
    super.initState();
    fcmRequestPermission();
    fcmForegroundNotification();
  }

  fcmRequestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging
        .requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    )
        .then((value) async {
      NotificationSettings settings = await messaging.getNotificationSettings();
      print('User granted permission: ${settings.authorizationStatus}');
      return settings;
    });
  }

  fcmForegroundNotification() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomizedAnimatedDrawer(
      authentication: widget.auth,
      homePageContent: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: null,
          title: Text(
            '️Group Chat',
            style: kAppBarTextStyle,
          ),
        ),
        body: SafeArea(
          child: ChatView(
            auth: widget.auth,
            documentID: DocumentGroupChat.documentID,
          ),
        ),
      ),
    );
  }
}
