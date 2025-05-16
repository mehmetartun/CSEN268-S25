import 'package:csen268_s25/model/car.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VehicleInputForm extends StatefulWidget {
  final void Function(Car) onSaved;
  const VehicleInputForm({super.key, required this.onSaved});

  @override
  State<VehicleInputForm> createState() => _VehicleInputFormState();
}

class _VehicleInputFormState extends State<VehicleInputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController regDateController = TextEditingController();

  Car? car;

  String? make;
  String? model;
  String? licensePlate;
  int? year;
  DateTime? registrationDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: "Make"),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Make cannot be empty";
              }
              return null;
            },
            onSaved: (val) {
              make = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Model"),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Model cannot be empty";
              }
              return null;
            },
            onSaved: (val) {
              model = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "License Plate"),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "License Plate cannot be empty";
              }
              return null;
            },
            onSaved: (val) {
              licensePlate = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Year"),
            validator: (val) {
              if (val == null || val.isEmpty || int.tryParse(val) == null) {
                return "Year must be integer";
              }
              if (int.tryParse(val)! < 1960 || int.tryParse(val)! > 2025) {
                return "Year must be between 1960 and 2025";
              }
              return null;
            },
            onSaved: (val) {
              year = int.parse(val!);
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Registration Date",
              suffix: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1960, 1, 1),
                    lastDate: DateTime(2025, 12, 31),
                  );
                  if (date != null) {
                    setState(() {
                      registrationDate = date;
                      regDateController.text = DateFormat(
                        "yyyy-MM-dd",
                      ).format(registrationDate!);
                    });
                  }
                },
              ),
            ),
            readOnly: true,
            controller: regDateController,
          ),
          // FilledButton.icon(
          //   label: Text("Pick Registration Date"),
          //   icon: Icon(Icons.calendar_today),
          //   onPressed: () async {
          //     DateTime? date = await showDatePicker(
          //       context: context,
          //       firstDate: DateTime(1960, 1, 1),
          //       lastDate: DateTime(2025, 12, 31),
          //     );
          //     if (date != null) {
          //       setState(() {
          //         registrationDate = date;
          //         regDateController.text = DateFormat(
          //           "yyyy-MM-dd",
          //         ).format(registrationDate!);
          //       });
          //     }
          //   },
          // ),
          SizedBox(height: 20),
          FilledButton(
            onPressed: () async {
              if ((_formKey.currentState?.validate() ?? false) &&
                  registrationDate != null) {
                _formKey.currentState?.save();
                widget.onSaved(
                  Car(
                    make: make!,
                    model: model!,
                    year: year!,
                    registrationDate: registrationDate!,
                    licencePlate: licensePlate!,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: Text("Submit Form"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    regDateController.dispose();
    super.dispose();
  }
}
