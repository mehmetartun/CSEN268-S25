## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 9 - 29 Apr 2025 - Lecture 9 Starting

We start with a simple router that points to the home page 
```dart
final GoRouter router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    name: "home",
    builder: (context, state) => GenericPage(title: "Home"),
  ),
]);
```
Which returns a `GenericPage` that is a widget created where either a child is passed or without a child it returns an empty `Container`.
```dart
class GenericPage extends StatelessWidget {
  const GenericPage({super.key, required this.title, this.child});
  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child ?? Container(),
    );
  }
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


