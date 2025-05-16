import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../model/car.dart';

part 'db_state.dart';

class DbCubit extends Cubit<DbState> {
  DbCubit() : super(DbInitial());

  FirebaseFirestore db = FirebaseFirestore.instance;

  late StreamSubscription<QuerySnapshot> vehiclesSubscription;
  late StreamSubscription<QuerySnapshot> collectionGroupDemoSubscription;

  List<Car> cars = [];

  void init() async {
    collectionGroupDemoSubscription = db
        .collectionGroup('cars')
        .where('make', isEqualTo: 'bmw')
        .where('model', isEqualTo: '330')
        .snapshots()
        .listen((qs) {
          qs.docs.forEach((doc) {
            print(doc.data());
          });
        });

    vehiclesSubscription = db
        .collection('vehicles')
        .where('make', isEqualTo: "BMW")
        .where('model', isEqualTo: "330i")
        .snapshots()
        .listen((qs) {
          cars = [];
          for (var i = 0; i < qs.docs.length; i++) {
            // print(qs.docs[i].data());
            cars.add(Car.fromFirestoreMap(qs.docs[i].data()));
          }
          emit(DbLoaded());
        });
    // await Future.delayed(Duration(seconds: 2), () {});
    emit(DbLoaded());
  }

  void addCar(Car car) async {
    emit(DbFetching());
    await db.collection('vehicles').add(car.toFirestoreMap());
    emit(DbLoaded());
  }

  @override
  Future<void> close() {
    // TODO: implement close
    vehiclesSubscription.cancel();
    collectionGroupDemoSubscription.cancel();
    return super.close();
  }
}
