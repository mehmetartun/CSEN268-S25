## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 15 -  Step 1 - Cloud Functions Initialized and Hello World Run   

We initialized Javascript Cloud Functions and we managed to run **HelloWorld**!

We created a service account key and saved it under `google_service_account.json` in the root of our project directory.

We also use a variable called GOOGLE_APPLICATION_CREDENTIALS which we export before running the emulator because the emulator needs to get access to the necessary keys to be able to initalize Firebase.

We add the `google_service_account.json` file to the `.gitignore` file.

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


