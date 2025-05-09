## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 12 - Step 3 - Implemented - Adding ThemeCubit

Our `ThemeCubit` is responsible for holding the state of the theme brightness. It has only one state and passes the `ThemeMode` enum on every state change:
```dart
final class ThemeState {
  final ThemeMode themeMode;

  const ThemeState({required this.themeMode});
}
```
Note here we didn't create an abstract class, we have only one State in this cubit.

In the `main.dart` file we the `ThemeCubit` created in the `MultiBlocProvider` together with `NotificationsBloc`.
```dart
     child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NotificationsBloc()..init()),
          BlocProvider(create: (context) => ThemeCubit()),
        ],
        child: ...
    }
```

And we wrap a `BlocBuilder` for the `ThemeState` just outside `MaterialApp`
```dart
BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                ...
              );
            },
          )
```

We also have a standalone widget `BrightnessSelector` which is defined in [brightness_selector.dart](/lib/widgets/brightness_selector.dart). This widget consists of three icon buttons which display the current brightness and also change it by accessing the `ThemeCubit`.
```dart
class BrightnessSelector extends StatelessWidget {
  Widget build(BuildContext context) {
    ThemeCubit cubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
          child: Row(
            children: [
              state.themeMode == ThemeMode.light
                  ? IconButton.filled(
                    icon: Icon(Icons.light_mode),
                    onPressed: () {},
                  )
                  : IconButton.filledTonal(
                    icon: Icon(Icons.light_mode),
                    onPressed: () {
                      cubit.changeThemeMode(ThemeMode.light);
                    },
                  ),
                  ...
            ])));
```
### Setting up your environment before the lecture

Each lecture is stored under a separate tag. In your computer do the following

    git clone <Repository Name>
    git pull
    git tag -l

This will list you all the tags in the repository such as

    L05.00
    L05.01
    ...
    L06.00
    ...

In order to pull a particular tag like L06.00 to your computer

    git checkout tags/L06.00 -b l06_00


