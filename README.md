## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 7 - Start - 22 Apr 2025

In this lecture we look at implementing bloc library using `Bloc` and `Cubit`

As of our starting point we have already the following in the code:
- The `flutter_bloc` package [flutter_bloc](https://pub.dev/packages/flutter_bloc) is referenced in our [pubspec.yaml](/pubspec.yaml)
- We created a directory called `repositories` and under that a directory named `authentication` where we placed our file [authentication_repository.dart](/lib/repositories/authentication/authentication_repository.dart)
- We created an `AuthenticationRepository` as an `abstract class`. The only method in that it implements is the `signIn()` method.
- We also created two further repositories which **extend** this `abstract class`. These are `FirebaseAuthenticationRepository` and `OktaAuthenticationRepository` both of which are implementing the `signIn()` method.
- The `signIn()` method is an `async` function which takes no argument but returns a `User` object. As we have no integration done, it will just return a mock `User` with with the `createMockUser()` method.

### Authentication Repository
The abstract class is defined as
```dart
abstract class AuthenticationRepository {
  Future<User> signIn({required String email, required String password});
}
```
And each of the specific implementations are defined as 
```dart
class FirebaseAuthenticationRepository extends AuthenticationRepository {
  Future<void> someFirebaseSpecificMethod() async {
    await Future.delayed(const Duration(seconds: 10), () {});
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    await someFirebaseSpecificMethod();
    return User.createMockUser();
  }
}
```
and 
```dart
class OktaAuthenticationRepository extends AuthenticationRepository {
  Future<void> someOktaSpecificMethod() async {
    await Future.delayed(const Duration(seconds: 2), () {});
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    await someOktaSpecificMethod();
    return User.createMockUser();
  }
}
```
Note here that each implementation has **common** method(s) such as `signIn()` as dictated by the `abstract class` as well as **unique** methods that is implementation specific. In this case the `FirebaseAuthenticationRepository` calls some proprietary methods such as `someFirebaseSpecificMethod()` before returning the `User` and the `OktaAuthenticationRepository` calls `someOktaSpecificMethod()` before returning the `User`.

### Injection of the Repository into the Widget Tree
In the (lib/main.dart)[main.dart] we inject the `AuthenticationRepository` in the tree in this way:
```dart
class MyApp extends StatelessWidget {
  ...
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return (FirebaseAuthenticationRepository() as AuthenticationRepository);
      },
      child: MaterialApp(
        ...
        home: const LoginPage(),
        ...
      ),
    );
  }
}
```

### Creating a Login Page
We create a new page as a `StatefulWidget` called [login_page.dart](/lib/pages/login_page.dart) which contains a `Form` that for signing in.

In the initialization phase of this widget we reference the repository and create a handle to it
```dart
  late AuthenticationRepository repo;
  void initState() {
    repo = RepositoryProvider.of<AuthenticationRepository>(context);
    super.initState();
  }
```

We also create a method called `loginUser()` that calls the `signIn()` method of the repository. Before calling this `email` and `password` should have been set which is done by the `Form`
```dart
  User? user;
  String? email;
  String? password;
  void loginUser() async {
    setState(() {
      busy = true;
    });
    user = await repo.signIn(email: email!, password: password!);
    setState(() {
      busy = false;
    });
  }
```


How a `Form` operates will be discussed later, therefore we should take this as is for now. 
It's important to look at the `FilledButton` which submits the form:
```dart
    FilledButton(
        onPressed:
            busy
                ? null
                : () {
                if (_formKey.currentState?.validate() ??
                    false) {
                    _formKey.currentState?.save();
                    loginUser();
                }
                },
        child: const Text('Login'),
    ),
```
At the high level this is how the `Form` operates when this button is pressed:
- Consider each child that's a `FormField`
- When `validate()` is called, invoke the `validator` function of each of the `FormField`s.
- If any of these return a `String` that means something is not right and this string shall be used as the `error` text of that `FormField`. The `validate()` method returns `false`
- If all of them return `null` then the `validate()` method returns `true`
- Now that we have returned `true` we progress to the saving part.
- Each `FormField` child has a `save()` method and in this case the variables `email` and `password` are populated.
- We are now ready to call the `loginUser()` method.
- This results in `user` to be not `null` and we see the authentication status change displayed via the following text
```dart
    Text(
    user == null
        ? "Unauthenticated"
        : "${user!.firstName} ${user!.lastName}",
    ),
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


