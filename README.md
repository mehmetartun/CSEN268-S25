## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 12 - Step 2 - Implemented - Adding a Theme

We start by creating a Material Theme in Figma.

<img src="/assets/images/Figma_start_material.png" alt="Material Theme Builder" width="200">

Choose the colors

<img src="/assets/images/Material2.png" alt="Material Theme Builder" width="200">

And export to Flutter

<img src="/assets/images/Material3.png" alt="Material Theme Builder" width="200">

We create a folder `theme` and save the file as `theme.dart`. 

### Google Fonts

We add Google Fonts by

```
flutter pub add google_fonts
```

### Adding to the App
We first create a `TextTheme` in the app:
```dart
    TextTheme textTheme = createTextTheme(
      context,
      "Roboto",
      "Playfair Display",
    );
```
Then we create our `MaterialTheme` class based on this `TextTheme`
```dart
    MaterialTheme theme = MaterialTheme(textTheme);
```
Finally we inject it to the App with all possible color modes for dark, light, high contrast etc.

```dart
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme.light(),
          darkTheme: theme.dark(),
          highContrastDarkTheme: theme.darkHighContrast(),
          highContrastTheme: theme.lightHighContrast(),
          themeMode: ThemeMode.light,
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


