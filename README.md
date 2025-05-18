## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 15 - Step 1 - Cloud Functions Installed

We install cloud functions 
```zsh
flutter pub add cloud_functions
```

And we also save a `google_service_account.json` in our root directory. We also create a shell script called `emulators_functions.sh`
```zsh
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/google_service_account.json"
firebase emulators:start --only functions
```
We need to change the mode to `755` for this shell script and run it as `./emulator_functions.sh`.

You should also immediately add this to your `.gitignore` file:
```zsh
**/node_modules
**/google_service_account.json
```




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


