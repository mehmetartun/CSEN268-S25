import 'package:csen268_s25/pages/db/forms/vehicle_input_form.dart';
import 'package:flutter/material.dart';

import '../../../model/car.dart';

class DbDisplayView extends StatelessWidget {
  final List<Car> cars;
  final Function(Car) addCar;
  const DbDisplayView({super.key, required this.cars, required this.addCar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Db View"),
        actions: [
          TextButton(
            child: Text("Add"),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: SingleChildScrollView(
                      child: VehicleInputForm(onSaved: addCar),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
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
