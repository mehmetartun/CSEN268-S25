import 'package:flutter/material.dart';

import '../../../model/car.dart';

class DbDisplayView extends StatelessWidget {
  final List<Car> cars;
  const DbDisplayView({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Db View")),
      body: ListView(
        children: [
          ...cars.map((car) {
            return ListTile(title: Text(car.make));
          }).toList(),
        ],
      ),
    );
  }
}
