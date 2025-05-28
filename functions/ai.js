const {
    z,
    genkit,
    gemini15Flash,
    googleAI,
    apiKey,
    onCallGenkit

} = require("./init.js");

const ai = genkit({
  plugins: [googleAI()],
  model: gemini15Flash,
});

const jokeTeller = ai.defineFlow({
  name: "jokeTeller",
  inputSchema: z.string().nullable(),
  outputSchema: z.string(),
  streamSchema: z.string(),
}, async (jokeType = "knock-knock", {sendChunk}) => {
  const prompt = `Tell me a ${jokeType} joke.`;

  // Call the `generateStream()` method to
  // receive the `stream` async iterable.
  const {stream, response: aiResponse} = ai.generateStream(prompt);

  // Send new words of the generative AI response
  // to the client as they are generated.
  for await (const chunk of stream) {
    sendChunk(chunk.text);
  }

  // Return the full generative AI response
  // to clients that may not support streaming.
  return (await aiResponse).text;
},
);

exports.tellJoke = onCallGenkit({
  // [START bind-secrets]
  // Bind the Gemini API key secret parameter to the function.
  secrets: [apiKey],
  // [END bind-secrets]
},
// Pass in the genkit flow.
jokeTeller,
);
// [END trigger]
// [END complete-example]

