## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 8 - 24 Apr 2025 - Implement Go Router with Nested ShellRoute

In this part we implement a shell route for the following structure:

<img src="assets/images/Lecture 0801 Implementation Picture.png" width="600">

To do that we first inject an `AuthenticationBloc` into the tree above the `MaterialApp`

```dart
class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authenticationBloc = AuthenticationBloc();
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return (OktaAuthenticationRepository() as AuthenticationRepository);
      },
      child: BlocProvider(
        create: (context) => authenticationBloc..add(AuthenticationLoginEvent()),
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ...
          routerConfig: routerDemo(authenticationBloc),
        ),
      ),
    );
  }
}
```
Here the `bloc` is injected **after** the `RepositoryProvider` as the the bloc will require the `AuthenticationRepository` to be able to do the signing in.

The `router` object is now defined together with a the `refreshListenable` and the `redirect` configurations to handle changes to the `AuthenticationState` and direct the routing accordingly. This is affected by:
```dart
GoRouter routerDemo(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/users',
    refreshListenable: StreamToListenable([authenticationBloc.stream]),
    redirect: (context, state) async {
      if (authenticationBloc.state is AuthenticationLoggedOut &&
          (!(state.fullPath?.startsWith("/login") ?? false))) {
        return "/login";
      } else {
        if ((state.fullPath?.startsWith("/login") ?? false) &&
            authenticationBloc.state is AuthenticationLoggedIn) {
          return "/users";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) {
          return const RouterDemoLogin();
        },
      ),
      GoRoute(
        path: '/',
        name: RouteName.home,
        builder: (context, state) {
          return const RouterDemoHome();
        },
        routes: [
          ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return ScaffoldWithNavBar(child: child);
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'users',
                name: RouteName.users,
                builder: (BuildContext context, GoRouterState state) {
                  return const RouterDemoUsers();
                },
              ),
              GoRoute(
                path: 'profile',
                name: RouteName.profile,
                builder: (BuildContext context, GoRouterState state) {
                  return const RouterDemoProfile();
                },
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: RouteName.profileDetail,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      return const RouterDemoProfileDetail();
                    },
                  ),
}
```
The `ScaffoldWithNavBar` is a construct to allow the `ShellRoute` to have bottom navigation bottoms. It's defined in [ScaffoldWithNavBar](/lib/widgets/scaffold_with_nav_bar.dart).

In addition the `StreamToListenable` is defined in the [utilities](./lib/utilities) folder as [StreamToListenable](/lib/utilities/stream_to_listenable.dart) which takes a list of streams as argument and turns them to a combined listenable object that is then used to trigger `redirect` everytime the listenable receives an update.

The resulting app is then as:
<img src="/assets/images/Lecture 0801 Implemented App.gif" width="300">


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


