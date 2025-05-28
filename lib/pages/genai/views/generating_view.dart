import 'package:flutter/material.dart';

class GeneratingView extends StatelessWidget {
  const GeneratingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generating")),
      body: SingleChildScrollView(
        child: Column(
          children: [Text("Generating..."), CircularProgressIndicator()],
        ),
      ),
    );
  }
}
