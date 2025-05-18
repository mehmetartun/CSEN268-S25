## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 15 -  Step 1 - Cloud Functions Installed and Run

Installed Cloud Functions with
```zsh
firebase init
```
and created `google_service_account.json` giving us the keys to access Firebase. This is added to gitignore along with node modules:
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


