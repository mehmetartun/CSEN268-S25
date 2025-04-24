import 'package:flutter/material.dart';

class RouterDemoProfileDetail extends StatelessWidget {
  const RouterDemoProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(children: [Text("Router Demo Profile Detail Page")]),
      ),
    );
  }
}
