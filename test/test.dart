import 'package:csen268_s25/blocs/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CounterCubit cubit = CounterCubit();
  test("Counter Cubit Test", () {
    cubit.add();
    expect(cubit.counter, 1);
    cubit.subtract();
    expect(cubit.counter, 1);
  });
}
