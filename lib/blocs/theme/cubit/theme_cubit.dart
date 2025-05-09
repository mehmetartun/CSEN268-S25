import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.dark));
  ThemeMode themeMode = ThemeMode.system;

  void changeThemeMode(ThemeMode mode) {
    themeMode = mode;
    emit(ThemeState(themeMode: themeMode));
  }
}
