import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/theme/cubit/theme_cubit.dart';

class BrightnessSelector extends StatelessWidget {
  const BrightnessSelector({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit cubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.themeMode != ThemeMode.light)
                IconButton.filledTonal(
                  icon: Icon(Icons.light_mode),
                  onPressed: () {
                    cubit.changeThemeMode(ThemeMode.light);
                  },
                ),
              if (state.themeMode != ThemeMode.dark)
                IconButton.filledTonal(
                  icon: Icon(Icons.dark_mode),
                  onPressed: () {
                    cubit.changeThemeMode(ThemeMode.dark);
                  },
                ),

              if (state.themeMode != ThemeMode.system)
                IconButton.filledTonal(
                  icon: Icon(Icons.smartphone),
                  onPressed: () {
                    cubit.changeThemeMode(ThemeMode.system);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
