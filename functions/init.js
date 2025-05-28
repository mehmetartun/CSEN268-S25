const {onCall,onRequest,onCallGenkit} = require("firebase-functions/v2/https");
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");
const {onDocumentCreated}  = require("firebase-functions/v2/firestore");
const {defineSecret} = require("firebase-functions/params");

const logger = require("firebase-functions/logger");
const {gemini15Flash, googleAI} = require("@genkit-ai/googleai");
const {genkit, z} = require("genkit");
const apiKey = defineSecret("GEMINI_API_KEY");

initializeApp();

module.exports = {
    onCall, 
    onRequest,
    onCallGenkit,
    getFirestore,
    onDocumentCreated,
    z,
    genkit,
    gemini15Flash,
    googleAI,
    apiKey,
    logger
}