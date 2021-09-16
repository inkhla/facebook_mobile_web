import 'package:cpc_task/models/user_model.dart';
import 'package:cpc_task/shared/font_icons/flutter_app_bar_icons.dart';
import 'package:cpc_task/shared/style/constants.dart';
import 'package:cpc_task/shared/widgets/user.dart';
import 'package:flutter/material.dart';

class LeftSidePanel extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [Icons.account_circle_outlined, Colors.deepPurple, 'COVID-19 Info Center'],
    [Icons.group_outlined, Colors.cyan, 'Friends'],
    [FlutterAppBar.facebook_messenger, Palette.facebookBlue, 'Messenger'],
    [Icons.flag, Colors.orange, 'Pages'],
    [Icons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [Icons.calendar_today, Colors.red, 'Events'],
  ];

  final User currentUser;

  const LeftSidePanel({Key? key, required this.currentUser}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 280.0),
        child: ListView.builder(
          itemCount: 1 + _moreOptionsList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(user: currentUser),
              );
            }
            final List option = _moreOptionsList[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: _Option(
                icon: option[0],
                color: option[1],
                label: option[2],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option({Key? key, required this.icon , required this.color, required this.label}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}