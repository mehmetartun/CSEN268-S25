import 'package:flutter/material.dart';

class DbWaitingView extends StatelessWidget {
  const DbWaitingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Db Fetching")),
      body: SingleChildScrollView(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
