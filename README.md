## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 13 -  Implementing Future Builder, Shimmer, Stream Builder

### Step 2 - Implement StreamBuilder
To simulate `StreamBuilder` we create a `cities` collection in `Firestore`. We will then create a stream to this collection and display any changes in the collection in realtime.

#### Building a collection in Firestore
Our collection in Firestore looks like this:
![Cities](/assets/images/CitiesCollection.png)

#### Adding package for Firestore
```zsh
flutter pub add cloud_firestore
```

#### Creating a stream
We create `StreamBuilderPage` in [stream_builder_page](/lib/pages/stream_builder_page.dart) as a stateless widget returning a `StreamBuilder` in the body of the Scaffold.

The `StreamBuilder` widget works similar to `FutureBuilder`. In this case we have a `stream` and whenever there is an update in the `stream`, the `builder` kicks in and rebuilds the widget. In our case the stream is pointing to a **collection** in the **Firestore** database and we are getting all the documents in that collection. In this case the collection is `'cities'`.
```dart
    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        builder: (context, snapshot) {
        if (snapshot.hasData) {
            return ListView(
            shrinkWrap: true,
            children: snapshot.data?.docs.map((doc) {
                    return Text(doc.data()['name']);
                }).toList() ??
                [],
            );
        }
        return CircularProgressIndicator();
        },
        stream: FirebaseFirestore.instance
            .collection('cities')
            .snapshots(),
    ),
```
StreamBuilder works on the same concept as the FutureBuilder, the `AsyncSnapshot`. We check whether the `snapshot` has data and we can then access the data of the snapshot. The data in this case will be of type `QuerySnapshot` which comes from the Firestore package. The `QuerySnapshot` has `docs` property which is a `List<QueryDocumentSnapshot>`. Therefore we call
```dart
 snapshot.data?.docs.map((doc){ return Text(doc.data()['name']);});
```
The object `QueryDocumentSnapshot` has a `data()` method which exposes the data contained in the document as a `Map<String,dynamic>`. From this `Map` we select the `'name'` property which corresponds to the name of the city. In this the `doc.data()` will look like:
```json
{'name': 'London'}
```
If you want to get the ID of the document then you can access it as `doc.id`.

#### The City entry widget
To enter a new city name, we created a widget consisting of a `TextFormField` and an `OutlinedButton`. The interesting part of the widget is the `onSaved()` method where we add this value to the `'cities'` collection in the Firestore database.
```dart
    onSaved: (value) {
    FirebaseFirestore.instance
        .collection('cities')
        .add({'name': value});
    },
```
Also important to note is that we reset the value of the `TextFormField` after saving by calling `controller.clear()` of the `TextEditingController` attached to the `TextFormField`.
```dart
    if (_formKey.currentState?.validate() ?? false) {
        _formKey.currentState?.save();
        controller.clear();
    }
```

We get the following result:

![StreamBuilder Output](/assets/images/StreamBuilderDemo.gif)


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


