## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 14 -  Firebase Operations

Created a page `db_page.dart` to interact with Firebase with an associated `Cubit`. We also created a new object class `Car` together with it's associated data methods.

```dart
class Car {
  final String make;
  final String model;
  final String licencePlate;
  final int year;
  final DateTime registrationDate;
  ...
}
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


