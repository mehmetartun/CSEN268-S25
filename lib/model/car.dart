// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String make;
  final String model;
  final String licencePlate;
  final int year;
  final DateTime registrationDate;

  Car({
    required this.make,
    required this.model,
    required this.licencePlate,
    required this.year,
    required this.registrationDate,
  });

  Car copyWith({
    String? make,
    String? model,
    String? licencePlate,
    int? year,
    DateTime? registrationDate,
  }) {
    return Car(
      make: make ?? this.make,
      model: model ?? this.model,
      licencePlate: licencePlate ?? this.licencePlate,
      year: year ?? this.year,
      registrationDate: registrationDate ?? this.registrationDate,
    );
  }

  Map<String, dynamic> toFirestoreMap() {
    return <String, dynamic>{
      'make': make,
      'model': model,
      'licencePlate': licencePlate,
      'year': year,
      'registrationDate': Timestamp.fromDate(registrationDate),
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'make': make,
      'model': model,
      'licencePlate': licencePlate,
      'year': year,
      'registrationDate': registrationDate.millisecondsSinceEpoch,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      make: map['make'] as String,
      model: map['model'] as String,
      licencePlate: map['licencePlate'] as String,
      year: map['year'] as int,
      registrationDate: DateTime.fromMillisecondsSinceEpoch(
        map['registrationDate'] as int,
      ),
    );
  }

  factory Car.fromFirestoreMap(Map<String, dynamic> map) {
    return Car(
      make: map['make'] as String,
      model: map['model'] as String,
      licencePlate: map['licencePlate'] as String,
      year: map['year'] as int,
      registrationDate: (map['registrationDate'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) =>
      Car.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Car(make: $make, model: $model, licencePlate: $licencePlate, year: $year, registrationDate: $registrationDate)';
  }

  @override
  bool operator ==(covariant Car other) {
    if (identical(this, other)) return true;

    return other.make == make &&
        other.model == model &&
        other.licencePlate == licencePlate &&
        other.year == year &&
        other.registrationDate == registrationDate;
  }

  @override
  int get hashCode {
    return make.hashCode ^
        model.hashCode ^
        licencePlate.hashCode ^
        year.hashCode ^
        registrationDate.hashCode;
  }
}
