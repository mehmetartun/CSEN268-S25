## Santa Clara University - CSEN268 Spring 2025

[Table of Contents](/toc.md)

## Lecture 4 - 10 Apr 2025

In this lecture we created the **Hello World** app of flutter using
```zsh
flutter create csen268_s25
```
where **csen268_s25** is the project name.

### Stateless Widget    
We create a stateless widget called `PaddedText` which takes two arguments, the `text` value and the `padding` value which are `String` and `double` types respectively.
```dart
import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {
  final String text;
  final double padding;
  const PaddedText({super.key, required this.text, this.padding = 8.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      color: Colors.red,
      child: Text(text),
    );
  }
}

```
We need to note here that:
1. `text` is a `named` and `required` parameter
2. `padding` is a `named` but `optional` parameter which defaults to 8.0
3. The `key` is an optional identifier for widgets. When we pass a key to an object, with the `super.key` construct, this key is passed over to the `StatelessWidget` which is the `super class` of the `PaddedText` widget created here.



