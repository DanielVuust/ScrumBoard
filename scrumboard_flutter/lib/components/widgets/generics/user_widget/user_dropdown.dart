import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

class UserDropDown extends StatelessWidget {
  final List<User> users;
  final int? currentUserId;
  final bool showIcon;
  final Function(User) onChanged;
  const UserDropDown({
    super.key,
    required this.currentUserId,
    required this.users,
    required this.onChanged,
    this.showIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: users.firstWhere((element) => element.id == currentUserId),
      items: users.map((User user) {
        return DropdownMenuItem(
          value: user,
          child: Text(
            "${user.firstName} ${user.lastName}",
          ),
        );
      }).toList(),
      onChanged: (User? user) {
        if (user != null) {
          onChanged(user);
        }
      },
    );
  }
}
