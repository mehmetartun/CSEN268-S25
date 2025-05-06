import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestorePage extends StatelessWidget {
  const FirestorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firestore")),
      body: Center(
        child: FilledButton(
          child: Text("Add to Firestore"),
          onPressed: () async {
            FirebaseFirestore.instance.collection('test').add({
              'value': 'test @ ${DateTime.now().millisecondsSinceEpoch}',
            });
          },
        ),
      ),
    );
  }
}
