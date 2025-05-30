## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

## Lecture 18 - Flutter Web, WebView and Ads
In this lecture we will explore Flutter Web, WebView and Ads

### Step 04 - Navigation Delegate
With `NavigationDelegate` one can prevent certain websites being visited.
```zsh
  @override
  void initState() {
    controller = TextEditingController(text: "google.com");
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          NavigationDelegate(onNavigationRequest: (request) {
        if (request.url.contains("youtube")) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("This destination is not allowed")));
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }));
    super.initState();
  }
```
You can modify this also to ensure that customer stays in your domain.

### Setting up your environment before the lecture

Each lecture is stored under a separate tag. On your computer do the following

    git clone <Repository Name>
    git pull
    git tag -l

This will list all the tags in the repository such as

    Lecture4
    Lecture5
    Lecture6
    ...

In order to pull a particular tag to your computer

    git checkout tags/Lecture5_start -b Lecture5_study

