## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 11 - Step 2 -  Firebase Cloud Messaging Bloc

In this part we set up a `bloc` to handle incoming messages.

In this part we implement a Notifications Bloc which handles the messages coming into the platform. The event handlers correspond to three event types in [notifications_bloc.dart](/lib/blocs/notifications/bloc/notifications_bloc.dart):

```dart
    on<NotificationsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NotificationsOnMessageEvent>((event, emit) {
      emit(NotificationsReceivedState(
          message: event.message,
          notificationType: NotificationType.onMessage));
    });
    on<NotificationsOnMessageOpenedAppEvent>((event, emit) {
      emit(NotificationsReceivedState(
          message: event.message,
          notificationType: NotificationType.onMessageOpenedApp));
    });
    on<NotificationsOnBackgroundMessageEvent>((event, emit) {
      emit(NotificationsReceivedState(
          message: event.message,
          notificationType: NotificationType.onBackgroundMessage));
    });
```
These three event types are created by the following sources:
```dart
  void init() async {
    messageOpenedAppSubscription =
        FirebaseMessaging.onMessageOpenedApp.listen((message) {});

    messageSubscription = FirebaseMessaging.onMessage.listen((message) {
      print("message");
      add(NotificationsOnMessageEvent(message: message));
    });

    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      add(NotificationsOnBackgroundMessageEvent(message: message));
    }
  }
```
Note that the subscriptions are defined by:
```dart
  StreamSubscription<RemoteMessage>? messageSubscription;
  StreamSubscription<RemoteMessage>? messageOpenedAppSubscription;
```
and need to be cancelled on close of the bloc:
```dart
 @override
  Future<void> close() {
    // TODO: implement close
    messageSubscription?.cancel();
    messageOpenedAppSubscription?.cancel();
    return super.close();
  }
```

## Displaying messages

Now that we are catcing messages from Firebase, how do we display them? In [main.dart](/lib/main.dart) the `build()` method of `MyApp()` is of this form:
```dart
  Widget build(BuildContext context) {
    return RepositoryProvider(
      ...
      child: BlocProvider(
        ... // create the bloc
        child: MaterialApp(
            ...
            builder: (context, child) {
              ...
              return BlocListener<NotificationsBloc, NotificationsState>(
                listener: (context, state) async {
                  if (state is NotificationsReceivedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        ... // Show message here
                      ),
                    );
                  }
                },
                child: _child,
              );
            },
            ...
      ),
    );
  }
```
Here the `build()` method of the `MaterialApp` takes a child widget (normally the page that the Navigator presents to MaterialApp) and displays it. However, we interfere with this `build()` method and before rendering the `child` we wrap the child with a `BlocListener`. This gives us the ability to access the `child`, i.e. currently rendered page in the `MaterialApp`, and display a `SnackBar` in it's `context`.

The full implementation is below:
```dart
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return (OktaAuthenticationRepository() as AuthenticationRepository);
      },
      child: BlocProvider(  // We create the bloc here
        create: (context) => NotificationsBloc()..init(), // initialize it here with the listeners
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            builder: (context, child) { // we override the default build method 
              Widget _child = child ?? Container();
              return BlocListener<NotificationsBloc, NotificationsState>( // wrap a BlocListener around the child
                listener: (context, state) async {
                  if (state is NotificationsReceivedState) {
                    ScaffoldMessenger.of(context).showSnackBar( // we access the ScaffoldMessenger of the child
                      SnackBar(                                 // and show the Snackbar
                        behavior: SnackBarBehavior.floating,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                state.message.notification?.title ?? "<title>"),
                            Text(state.message.notification?.body ?? "<body>"),
                            Text("Type: ${state.notificationType.name}"),
                          ],
                        ),
                      ),
                    );
                  }
                },
                child: _child,
              );
            },
            home: MessagingPage()),
      ),
    );
  }
}
```

Ultimately we get the notifications bloc working as:
<img src="/assets/images/FCMWorking.gif" alt="FCM Working" width="600">

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


