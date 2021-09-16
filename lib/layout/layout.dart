import 'package:cpc_task/layout/cubit/cubit.dart';
import 'package:cpc_task/layout/cubit/states.dart';
import 'package:cpc_task/local%20data/data.dart';
import 'package:cpc_task/shared/style/constants.dart';
import 'package:cpc_task/shared/widgets/android/android_custome_app_bar.dart';
import 'package:cpc_task/shared/widgets/web/web_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookCubit, FacebookStates>(
        listener: (context, state) {
      if (state is FacebookLoadingState) {
        Future.delayed(const Duration(seconds: 2), () {});
      }
    }, builder: (context, state) {
      Size screenSize = MediaQuery.of(context).size;
      var cubit = FacebookCubit.get(context);
      return SafeArea(
        child: Scaffold(
            backgroundColor: Palette.scaffold,
            appBar: kIsWeb
                ? PreferredSize(
                    child: CustomAppBar(
                      currentUser: currentUser,
                      icons: cubit.icons,
                      selectedIndex: cubit.selectedIndex,
                      onTap: (index) => cubit.changeTabBar(index),
                    ),
                    preferredSize: Size(screenSize.width, 100),
                  )
                : null,
            body: kIsWeb
                ? cubit.screens[cubit.selectedIndex]
                : const AndroidCustomAppBar()),
      );
    });
  }
}
