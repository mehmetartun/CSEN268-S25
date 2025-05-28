part of 'genai_cubit.dart';

sealed class GenaiState {}

final class GenaiInitial extends GenaiState {}

final class GenaiGenerating extends GenaiState {}

final class GenaiMain extends GenaiState {
  final String text;

  GenaiMain({required this.text});
}

final class GenaiError extends GenaiState {}
