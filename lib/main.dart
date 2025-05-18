import 'package:cloud_functions/cloud_functions.dart';
import 'package:csen268_s25/pages/alert_page.dart';
import 'package:csen268_s25/pages/db/db_page.dart';
import 'package:csen268_s25/pages/functions_demo.dart';
import 'package:csen268_s25/pages/future_builder_page.dart';
import 'package:csen268_s25/pages/stream_builder_page.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/notifications/bloc/notifications_bloc.dart';
import 'blocs/theme/cubit/theme_cubit.dart';
import 'firebase_options.dart';

import 'pages/generic_page.dart';
import 'pages/messaging_page.dart';
import 'repositories/authentication/authentication_repository.dart';
import 'theme/theme.dart';
import 'theme/util.dart';

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
  // FirebaseFunctions.instance.useFunctionsEmulator('127.0.0.1', 5001);
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(
      context,
      "Roboto",
      "Roboto Condensed",
    );

    MaterialTheme theme = MaterialTheme(textTheme);

    return RepositoryProvider(
      create: (context) {
        return (OktaAuthenticationRepository() as AuthenticationRepository);
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NotificationsBloc()..init()),
          BlocProvider(create: (context) => ThemeCubit()),
        ],
        child: BlocListener<NotificationsBloc, NotificationsState>(
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
                      Text("Type: //${state.notificationType.name}"),
                    ],
                  ),
                ),
              );
            }
          },
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: theme.light(),
                darkTheme: theme.dark(),
                highContrastDarkTheme: theme.darkHighContrast(),
                highContrastTheme: theme.lightHighContrast(),
                themeMode: themeState.themeMode,
                home: FunctionsDemoPage(),
              );
            },
          ),
        ),
      ),
    );
  }
}
