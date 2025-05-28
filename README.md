## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 16 -  Generative AI

For Generative AI we obtain a GEMINI Api Key and use it in our code to call the genai function. This key has to be inserted into the secrets:
```zsh
firebase functions:secrets:set GEMINI_API_KEY
```
and in the next line in the prompt enter your API key.

In cloud functions we have to define the ai model as:
```js
const ai = genkit({
  plugins: [googleAI()],
  model: gemini15Flash,
});
```
and we also define a **flow** which tells the ai how the inputs and outputs work:
```js
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
```
This flow supports streaming but we will be using it in the normal mode.

The API Key is retrieved from the secrets with the statement:
```js
const apiKey = defineSecret("GEMINI_API_KEY");
```
And finally the function definition is:
```js
exports.tellJoke = onCallGenkit({
  secrets: [apiKey],
},
jokeTeller,
);
```
Note that it's `onCallGenkit` rather than `onCall`.

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


