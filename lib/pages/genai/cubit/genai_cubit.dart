import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'genai_state.dart';

class GenaiCubit extends Cubit<GenaiState> {
  GenaiCubit() : super(GenaiInitial());

  HttpsCallable tellJoke = FirebaseFunctions.instance.httpsCallable(
    'ai-tellJoke',
  );

  HttpsCallable helloWorld = FirebaseFunctions.instance.httpsCallable(
    'misc-helloWorldCall',
  );

  void init() {
    emit(GenaiMain(text: "Click button to generate Joke"));
  }

  void getJoke() async {
    emit(GenaiGenerating());
    var result = await tellJoke.call();

    emit(GenaiMain(text: result.data as String));
  }
}
