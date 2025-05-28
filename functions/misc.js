

const {
    onRequest,
    onCall,
    logger
} = require("./init.js")

const {z } = require("zod/v4");

exports.helloWorld = onRequest((request, response) => {
  logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

exports.helloWorldCall = onCall((request) => {
  const myemailschema = z.email();
  var result;
  try{
    result = myemailschema.parse("sd:asdsdad");
  } catch (e){
    console.log(e);
  }
  return {'message':'Hello from Firebase'};
});