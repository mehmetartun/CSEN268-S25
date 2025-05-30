import 'package:cloud_functions/cloud_functions.dart';
import 'package:csen268_s25/pages/genai/genai_page.dart';
import 'package:csen268_s25/pages/generic_page.dart';
import 'package:csen268_s25/pages/web_view_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/theme/cubit/theme_cubit.dart';
import 'firebase_options.dart';

import 'pages/in_app_web_view_page.dart';
import 'repositories/authentication/authentication_repository.dart';
import 'theme/theme.dart';
import 'theme/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FirebaseFunctions.instance.useFunctionsEmulator('127.0.0.1', 5001);
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);

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
        providers: [BlocProvider(create: (context) => ThemeCubit())],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: theme.light(),
              darkTheme: theme.dark(),
              highContrastDarkTheme: theme.darkHighContrast(),
              highContrastTheme: theme.lightHighContrast(),
              themeMode: themeState.themeMode,
              home: Builder(
                builder: (context) {
                  return GenericPage(
                    title: "WebView",
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: FilledButton(
                              child: Text("WebView"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: FilledButton(
                              child: Text("InAppWebView"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InAppWebViewPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
