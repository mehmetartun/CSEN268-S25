import 'package:csen268_s25/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/navigator_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About this page", style: tt.headlineMedium),
              const Text(
                "This is the home page, or the route '/' in the routes"
                " defined in the Material App. The other pages are defined as routes"
                " as well. When the respective buttons are pressed, these pages are 'pushed' on "
                "the stack. Their scaffold will automatically get a 'back' button that 'pops' the stack.",
              ),
              const SizedBox(height: 10),
              Text("The Routes", style: tt.headlineMedium),
              const Text(
                "Implementation of Repository Provider within a Stateful Widget."
                " Here we access the repository provider from within the stateful"
                " widget and directly access repository methods from the UI widget."
                " This is not the recommended route",
              ),
              const SizedBox(height: 10),
              FilledButton(
                child: const Text("Login - no Bloc/Cubit"),
                onPressed: () {
                  context.goNamed(RouteName.noBloc);
                },
              ),
              const SizedBox(height: 30),
              const Text("Implementation of Repository Provider with Cubit"),
              const SizedBox(height: 10),
              FilledButton(
                child: const Text("Login with Cubit"),
                onPressed: () {
                  context.goNamed(RouteName.cubit);
                },
              ),
              const SizedBox(height: 30),
              const Text("Implementation of Repository Provider with Bloc"),
              const SizedBox(height: 10),
              FilledButton(
                child: const Text("Login with Bloc"),
                onPressed: () {
                  context.goNamed(RouteName.bloc);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
