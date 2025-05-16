import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/db_cubit.dart';
import 'views/db_display_view.dart';
import 'views/db_waiting_view.dart';

class DbPage extends StatelessWidget {
  const DbPage({super.key});

  @override
  Widget build(BuildContext context) {
    DbCubit cubit = DbCubit()..init();
    return BlocProvider(
      create: (context) {
        return cubit;
      },
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          switch (state) {
            case DbInitial _:
            case DbFetching _:
              return DbWaitingView();
            case DbLoaded _:
              return DbDisplayView(cars: cubit.cars);
            default:
              return DbWaitingView();
          }
        },
      ),
    );
  }
}
