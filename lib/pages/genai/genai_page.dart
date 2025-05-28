import 'package:csen268_s25/pages/genai/cubit/genai_cubit.dart';
import 'package:csen268_s25/pages/genai/views/error_view.dart';
import 'package:csen268_s25/pages/genai/views/generating_view.dart';
import 'package:csen268_s25/pages/genai/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenaiPage extends StatelessWidget {
  const GenaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    GenaiCubit cubit = GenaiCubit()..init();
    return BlocProvider(
      create: (context) {
        return cubit;
      },
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          switch (state) {
            case GenaiInitial _:
            case GenaiGenerating _:
              return GeneratingView();
            case GenaiError _:
              return ErrorView();
            case GenaiMain _:
              return MainView(
                text: state.text,
                generateCallback: cubit.getJoke,
              );
            default:
              return GeneratingView();
          }
        },
      ),
    );
  }
}
