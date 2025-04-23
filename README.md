## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

### Lecture 7 - Partial Cubit Implementation - 22 Apr 2025

We created a new directory called [login](/lib/pages/login/) where we create further files:
- [cubit](/lib/pages/login/cubit/) where the `Cubit` is defined
- [views](/lib/pages/login/views/) where we define views corresponding to the states of the `Cubit`
- [login_page.dart](/lib/pages/login/login_page.dart) which has two functions
  1. To create the `Cubit`
  2. To act as a manager for the state


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


