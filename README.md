## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 10 - Starting Point - Firebase Integration

In this lecture we add Firebase to our project.

Import `firebase_core.dart` library 
```
flutter pub add firebase_core
```

and add the line
```dart
  WidgetsFlutterBinding.ensureInitialized();
```
in your [main.dart](/lib/main.dart) file.

Normally this binding will be initialized after the `runApp()` command is run. However for Firebase to work and for us to initialize the FirebaseApp in `main()` we must call this to force it.

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


