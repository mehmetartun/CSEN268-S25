/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */



// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started


exports.misc = require('./misc.js');
exports.db = require('./db.js');
exports.ai = require('./ai.js');












