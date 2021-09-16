import 'package:cpc_task/layout/cubit/states.dart';
import 'package:cpc_task/modules/screens/feeds_screen.dart';
import 'package:cpc_task/modules/screens/gourps_screen.dart';
import 'package:cpc_task/modules/screens/market_screen.dart';
import 'package:cpc_task/modules/screens/notifications_screen.dart';
import 'package:cpc_task/modules/screens/setting_screen.dart';
import 'package:cpc_task/modules/screens/watch_screen.dart';
import 'package:cpc_task/modules/web/web_home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacebookCubit extends Cubit<FacebookStates> {
  FacebookCubit() : super(FacebookInitialState());

  static FacebookCubit get(context) => BlocProvider.of(context);

  final List<Widget> screens = [
      kIsWeb ? WebHomeScreen() : const FeedsScreen(),
      const WatchScreen(),
      const MarketScreen(),
      const GroupsScreen(),
      const NotificationScreen(),
      const SettingScreen(),
  ];

  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    Icons.doorbell_outlined,
    Icons.group,
    Icons.menu,
  ];
  int selectedIndex = 0;

  final bool isBottomIndicator = false;

  void changeTabBar(int index)
  {
      selectedIndex = index;
  }

  void navigate (int index)
  {
    screens[selectedIndex];
  }

}