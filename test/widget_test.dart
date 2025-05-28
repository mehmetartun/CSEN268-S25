// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:csen268_s25/model/user.dart';
import 'package:csen268_s25/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createWidget(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  Widget createUserList() {
    return ListView(
      children: List.generate(20, (index) {
        return UserListTile(
          user: User(
            firstName: "First$index",
            lastName: "Last$index",
            imageUrl: "https://placehold.co/400x400",
            email: "first$index@last$index.com",
            uid: "$index",
          ),
        );
      }),
    );
  }

  testWidgets('UserListTile Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidget(
        UserListTile(
          user: User(
            firstName: "John",
            lastName: "Doe",
            email: "john@doe.com",
            imageUrl: "https://placehold.co/500x500",
            uid: "1234567890",
          ),
        ),
      ),
    );
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('JD'), findsOneWidget);
    expect(find.text('john@doe.com'), findsOneWidget);
    await tester.pumpWidget(
      createWidget(
        UserListTile(
          user: User(
            firstName: "John",
            lastName: "",
            email: "john@doe.com",
            imageUrl: "https://placehold.co/500x500",
            uid: "1234567890",
          ),
        ),
      ),
    );
    expect(find.text('John'), findsOneWidget);
    expect(find.text('J'), findsOneWidget);
    expect(find.text('john@doe.com'), findsOneWidget);
    await tester.pumpWidget(
      createWidget(
        UserListTile(
          user: User(
            firstName: "",
            lastName: "Doe",
            email: "john@doe.com",
            imageUrl: "https://placehold.co/500x500",
            uid: "1234567890",
          ),
        ),
      ),
    );
    expect(find.text('Doe'), findsOneWidget);
    expect(find.text('D'), findsOneWidget);
    expect(find.text('john@doe.com'), findsOneWidget);
    await tester.pumpWidget(
      createWidget(
        UserListTile(
          user: User(
            firstName: "",
            lastName: "",
            email: "john@doe.com",
            imageUrl: "https://placehold.co/500x500",
            uid: "1234567890",
          ),
        ),
      ),
    );
    expect(find.text('-'), findsExactly(2));
    expect(find.text('john@doe.com'), findsOneWidget);
  });

  testWidgets('ListView', (tester) async {
    await tester.pumpWidget(createWidget(createUserList()));
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOne);
    expect(find.text("First0 Last0"), findsOne);
    await tester.fling(find.byType(ListView), Offset(0, -200), 400);
    await tester.pumpAndSettle();
    expect(find.text("First0 Last0"), findsNothing);
    await tester.fling(find.byType(ListView), Offset(0, 200), 400);
    await tester.pumpAndSettle();
    expect(find.text("First0 Last0"), findsOne);
    await tester.tap(find.byType(UserListTile).first);
    await tester.pumpAndSettle();
    expect(find.text('First0 Last0 added.'), findsOne);
  });
}
