## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 15 -  Step 2 - Calling Cloud functions From the App

The method to call the functions from the app is via:
```dart
  final HttpsCallable helloWorldCall = FirebaseFunctions.instance.httpsCallable(
    'helloWorldCall',
  );
```
declaring the callable function in Flutter. Then the call is made by passing a `data` map to the callable function:
```dart
  HttpsCallableResult result = await addDataCall.call({
                  'collection': 'function_test',
                  'map': {'firstName': 'John', 'lastName': 'Doe'},
                });
```

The result that comes back has a property called `data` which contains the returned value.

On the functions side, we initialize the app to connect to Firestore
```javascript
initializeApp();
```

To connect to Firestore we call:
```javascript
  var documentReference = await getFirestore().collection(collection).add(map);
```

To write data (in this case `map`) to the given collection as a new document. Returned documentReference can then be used if necessary.

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


