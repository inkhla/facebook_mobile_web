import 'package:cpc_task/shared/style/constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({Key? key, required this.icons, required this.selectedIndex, required this.onTap, this.isBottomIndicator = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: TabBar(
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          border: isBottomIndicator
              ? const Border(
            bottom: BorderSide(
              color: Palette.facebookBlue,
              width: 3.0,
            ),
          )
              : const Border(
            top: BorderSide(
              color: Palette.facebookBlue,
              width: 3.0,
            ),
          ),
        ),
        tabs: icons
            .asMap()
            .map((i, e) => MapEntry(
          i,
          Tab(
            icon: Icon(
              e,
              color: i == selectedIndex
                  ? Palette.facebookBlue
                  : Colors.black45,
              size: 30.0,
            ),
          ),
        ))
            .values
            .toList(),
        onTap: onTap,
      ),
    );
  }
}