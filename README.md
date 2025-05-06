## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 10 - Step 1 -  Firebase Integration Complete

Following the instructions in the slide we have now integrated our 3 apps from Firebase into our project.

We ran `flutterfire configure` in the root directory of our app and then chose the firebase project we want to connect. Having created **iOS**, **Android**, and **Web** apps in the firebase project we choose only these three options to configure flutterfire.

At the end of the configuration `flutterfire` brings in the necessary `GoogleService-Info.plist` file into **iOS** and the `google-services.json` file into the **android** directories.

In the [main.dart](/lib/main.dart) we invoke Firebase by
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
```

Then the app loads up `FirestorePage` which displays a button:
```dart
        FilledButton(
          child: Text("Add to Firestore"),
          onPressed: () async {
            FirebaseFirestore.instance.collection('test').add({
              'value': 'test @ ${DateTime.now().millisecondsSinceEpoch}',
            });
          },
        )
```
that adds a document to the `test` collection. The document added is an object with only one property `value`. By using `add` command we imply that the document ID is automatically generated.

### Cleaning up bundle identifier and package name

It's possible that your project was created with a package name of `com.example.???`. In this case adding Firebase with the `flutterfire` route will still 

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


