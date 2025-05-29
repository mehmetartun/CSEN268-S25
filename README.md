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

## Running in the Simulator 

1.  We created a function `./emulators_functions.sh` and gave it execute permission with `chmod 755 emulators_functions.sh`. The contents of this function is:
    ```zsh
    export GOOGLE_APPLICATION_CREDENTIALS="/Users/mehmetartun/Development/csen268/CSEN268-S25/google_service_account.json"
    firebase emulators:start --only functions
    ```
    to have reference to your file `google_service_account.json`.

2.  The other thing you need to do is to set:
    ```xml
    <manifest>
      <application
          ...
          android:usesCleartextTraffic="true"
          ...
          >
          ...
      </application>
      ...
    </manifest>
    ```
    in the `<application>` section of the [AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml)

3.  Before running simulator you **must** deploy the functions to Firebase if you are using a namespace. Only then you will be able to run it in simulator mode.
    ```zsh
    firebase deploy --only functions
    ```
    will allow you deploy the functions to the cloud. Once you've done this, you will be able to use these functions with the simulator.




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


