## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 8 - 24 Apr 2025 - Starting Point 
In the starting point of this lecture we have moved to the `GoRouter` with the package [go_router](https://pub.dev/packages/go_router)

Therefore our `MyApp` is now changed to use the `.router()` constructor of `MaterialApp`:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return (OktaAuthenticationRepository() as AuthenticationRepository);
      },
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ...
        routerConfig: router,
      ),
    );
  }
}
```
Here the `router` is the `GoRouter` object defined in the file [router.dart](./lib/navigation/router.dart). 
```dart
final router = GoRouter(
  routes: [
    GoRoute(
      name: RouteName.home,
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          name: RouteName.bloc,
          path: 'bloc',
          builder: (context, state) {
            return const SignInPage();
          },
        ),
        GoRoute(...),
        GoRoute(...),
      ],
    ),
  ],
);
```
together with a `RouteName` class such that we don't call the routes from inside the app with arbitrary strings. Note that the routes `/bloc`, `/cubit`, and `/noBloc` are **child routes** of `/`. That's why the `path` property of these child routes are defined without the preceding `/`.
```dart
class RouteName {
  static const home = "home";
  static const bloc = "bloc";   
  ...
}
```
At this stage the code can handle `/`, `/bloc`, `/cubit`,`/noBloc`. Instead of defining routes in the `MaterialApp`, we defined these routes here and we can move to these routes as in the below `FilledButton` located in [home_page.dart](./lib/pages/home_page.dart)
```dart
class HomePage extends StatelessWidget {
  ...
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SingleChildScrollView(
            ...
              FilledButton(
                child: const Text("Login with Bloc"),
                onPressed: () {
                  context.goNamed(RouteName.bloc);
                },
    ...
}
```
where the command to go to a particular route is `context.goNamed()`.

<img src="/assets/images/Lecture0800.gif" alt="App" width="300">

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

