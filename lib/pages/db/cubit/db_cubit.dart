import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../model/car.dart';

part 'db_state.dart';

class DbCubit extends Cubit<DbState> {
  DbCubit() : super(DbInitial());

  FirebaseFirestore db = FirebaseFirestore.instance;

  List<Car> cars = [];

  void init() async {
    await Future.delayed(Duration(seconds: 2), () {});
    emit(DbLoaded());
  }

  void addCar(Car car) async {
    emit(DbFetching());
    await db.collection('vehicles').add(car.toFirestoreMap());
    emit(DbLoaded());
  }
}
