import 'package:csen268_s25/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';
import '../widgets/user_card.dart';
import '../widgets/user_list_tile.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    User myUser = User.createMockUser();

    List<User> userList = List.generate(20, (index) {
      return User.createMockUser();
    });

    print(userList);
    return Scaffold(
      appBar: AppBar(title: Text("User List")),

      body: ListView(
        children:
            userList.map((user) {
              return UserListTile(user: user);
            }).toList(),
      ),
    );
  }
}
