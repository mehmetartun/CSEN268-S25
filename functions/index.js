/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onCall,onRequest} = require("firebase-functions/v2/https");
const {initializeApp} = require("firebase-admin/app")
const {getFirestore} = require("firebase-admin/firestore")

const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

initializeApp();

exports.helloWorld = onRequest((request, response) => {
  logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

exports.helloWorldCall = onCall((request) => {
  return {'message':'Hello from Firebase'};
});

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





