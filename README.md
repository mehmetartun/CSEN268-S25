## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 5 - Step 2 - 15 Apr 2025

What we created in this lecture are as follows

### Mock Service

We created a `Mock` class to enable random generation of users. 
```dart
const List<String> colors = [
  "green",
  ...
  "brown"
];

class Mock {
  static String firstName() {
    return lorem(paragraphs: 1, words: 1).replaceAll(".", "");
  }
  ...
}

```
The `Mock` class has `static` methods which can be called without instantiating the class. They give us a first name, last name, email, user id, and an image url for creating mock users.

### The User Class
The `User` class is important as it allows us to load a `User` from the database. We need methods such as creation from `json` as well as output to `json` for saving into the database and also methods to create mock users.

Here we used the data generation extension to automatically create the methods associated with loading the objects from database and writing to database. In particular some of these methods are:

- `toMap`,`toJson` for converting the `User` into a `Map` or `json`
- `fromMap`, `fromJson` for creating a `User` from a `Map` or `json`
- `toString` override for printing out the `User` when used in a `print()` or  string interpolation.
- `createMockUser` to create a `User` using the `Mock` service

### The Widgets

We also created some widgets that enable us to display our `User`. These are `UserCard` and `UserListTile`. They both take a `User` object as input.

### The User List Page

In this page we use `ListView` to display users which we created using the `List.generate` method:
```dart
    List<User> userList = List.generate(20, (index) {
      return User.createMockUser();
    });
```
We then display this list in our page with a `ListView` as the `body` of our `Scaffold`.
```dart
      body: ListView(
        children:
            userList.map((user) {
              return UserListTile(user: user);
            }).toList(),
      ),
```
In the most basic usage `ListView` takes the `children` argument and which would be `List` of `Widget`. Other constructors and more info can be found at [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)


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

In order to pull a particular tag to your computer

    git checkout tags/L05.02 -b l05_02


