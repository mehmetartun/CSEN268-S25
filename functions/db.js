const {
    onCall,
    getFirestore,
    onDocumentCreated
} = require("./init.js");


exports.addData = onCall(async (request) => {
  var collection = request.data['collection'];
  var map = request.data['map'];
  var documentReference = await getFirestore().collection(collection).add(map);
  return {'path':documentReference.path, 'id':documentReference.id};
});

exports.getData = onCall(async (request) => {
  var path = request.data['path'];
  var result = await getFirestore().doc(path).get();
  return {'data': result.data()};
});

exports.onUserCreated = onDocumentCreated("/function_test/{userId}" , async (event)=>{
  await getFirestore().collection('log_test').add(
    {
      'userId':event.params.userId,
      'createTime':event.data.createTime,
    }
  )
});

