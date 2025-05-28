import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  final String text;
  final void Function() generateCallback;
  const MainView({
    super.key,
    required this.text,
    required this.generateCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gen Ai"),
        actions: [
          TextButton(child: Text("New Joke"), onPressed: generateCallback),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [Text(text)]),
        ),
      ),
    );
  }
}
