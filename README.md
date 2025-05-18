## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 15 -  Step 3 - Event Triggers

In this section we implemented the event trigger due to Firestore database document creation
```javascript
exports.onUserCreated = onDocumentCreated("/function_test/{userId}" , async (event)=>{
  await getFirestore().collection('log_test').add(
    {
      'userId':event.params.userId,
      'createTime':event.data.createTime,
    }
  )
});
```
This matches any document with a path `/function_test/{userId}` and whenever a document with this pattern is created, it triggers this function. In turn we can act on this data.


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


