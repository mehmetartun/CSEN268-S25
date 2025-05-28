## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

## Lecture 17 - Testing
In this lecture we will explore testing of widgets and the app in general

### Packages
Add the following:
```zsh
flutter pub add dev:test 'dev:flutter_driver:{"sdk":"flutter"}' 'dev:integration_test:{"sdk":"flutter"}'
```
with `dev_dependency` meaning it's a development dependency included in **development** mode. They are not included in the **release** mode,.

### Basic Test of the App
A basic test is shown in the [widget_test.dart](/test/widget_test.dart). To run this test we can either:
```zsh
flutter test test/widget_test.dart
```
or
```zsh
flutter run test/widget_test.dart
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


