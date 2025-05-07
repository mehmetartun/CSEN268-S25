import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/notifications/bloc/notifications_bloc.dart';
import 'firebase_options.dart';

import 'pages/messaging_page.dart';
import 'repositories/authentication/authentication_repository.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  print('Message data: ${message.data}');
  print('Message notification: ${message.notification?.title}');
  print('Message notification: ${message.notification?.body}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print(await FirebaseInstallations.instance.getId());

  final messaging = FirebaseMessaging.instance;
  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  const vapidKey =
      "BH_09ih-mfPlKd-at-j1FQ-Uls6AoUOylRXwHX-zEqCmGBTf4-FzXkBeoFG0t7cDDYxG0Qh8pIV3Lg02_0eInHU";
  String? token;

  if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
    token = await messaging.getToken(vapidKey: vapidKey);
  } else {
    try {
      token = await messaging.getToken();
    } catch (e) {
      print("Error getting token $e");
    }
  }
  print("Messaging token: $token");
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Handling a foreground message: ${message.messageId}');
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
    // Do whatever you need to do with this message
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return (OktaAuthenticationRepository() as AuthenticationRepository);
      },
      child: BlocProvider(
        create: (context) => NotificationsBloc()..init(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          builder: (context, child) {
            Widget _child = child ?? Container();
            return BlocListener<NotificationsBloc, NotificationsState>(
              listener: (context, state) async {
                if (state is NotificationsReceivedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.message.notification?.title ?? "<title>"),
                          Text(state.message.notification?.body ?? "<body>"),
                          Text("Type: ${state.notificationType.name}"),
                        ],
                      ),
                    ),
                  );
                }
              },
              child: _child,
            );
          },
          home: MessagingPage(),
        ),
      ),
    );
  }
}
