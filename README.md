## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 14 -  Data Display and Indices

This part includes a stream subscription to the Firestore database. It established in the `init()` method of the cubit:
```dart
    vehiclesSubscription = db
        .collection('vehicles')
        .where('make', isEqualTo: "BMW")
        .where('model', isEqualTo: "330i")
        .snapshots()
        .listen((qs) {
          cars = [];
          for (var i = 0; i < qs.docs.length; i++) {
            // print(qs.docs[i].data());
            cars.add(Car.fromFirestoreMap(qs.docs[i].data()));
          }
          emit(DbLoaded());
        });
```
Everytime a new snapshot arrives, the cars list must be reset and repopulated. Once repopulated, we need to emit `DbLoaded()` such that the UI can update.

### Index building

The collection group index `cars` is a collection that is found under each `user` document inside the `users` collection. If **user1** has 2 cars and **user2** has 1 car, then the **collectionGroup** `cars` will have 3 items. However, for complex queries such as:
```dart
    collectionGroupDemoSubscription = db
        .collectionGroup('cars')
        .where('make', isEqualTo: 'bmw')
        .where('model', isEqualTo: '330')
        .snapshots()
        .listen((qs) {
          qs.docs.forEach((doc) {
            print(doc.data());
          });
        });
```
building of indices is necessary. For this purpose you will be given a link of this type:

[https://console.firebase.google.com/project/csen268-s25-g0/firestore/databases/-default-/indexes?create_composite=Cktwcm9qZWN0cy9jc2VuMjY4LXMyNS1nMC9kYXRhYmFzZXMvKGRlZmF1bHQpL2NvbGxlY3Rpb25Hcm91cHMvY2Fycy9pbmRleGVzL18QAhoICgRtYWtlEAEaCQoFbW9kZWwQARoMCghfX25hbWVfXxAB](https://console.firebase.google.com/project/csen268-s25-g0/firestore/databases/-default-/indexes?create_composite=Cktwcm9qZWN0cy9jc2VuMjY4LXMyNS1nMC9kYXRhYmFzZXMvKGRlZmF1bHQpL2NvbGxlY3Rpb25Hcm91cHMvY2Fycy9pbmRleGVzL18QAhoICgRtYWtlEAEaCQoFbW9kZWwQARoMCghfX25hbWVfXxAB)

which will allow you to set up the correct composite indices in Firestore.

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


