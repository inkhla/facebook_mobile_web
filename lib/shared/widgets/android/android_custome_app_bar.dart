import 'package:cpc_task/layout/cubit/cubit.dart';
import 'package:cpc_task/layout/cubit/states.dart';
import 'package:cpc_task/shared/font_icons/flutter_app_bar_icons.dart';
import 'package:cpc_task/shared/style/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AndroidCustomAppBar extends StatelessWidget {
  const AndroidCustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookCubit, FacebookStates>(
      listener: (context,state){},
      builder: (context,state) {
        var cubit = FacebookCubit.get(context);
        return DefaultTabController(
          length: cubit.screens.length,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  centerTitle: false,
                  floating: true,
                  pinned: true,
                  snap: true,
                  title: const Text(
                    'facebook',
                    style: TextStyle(
                      fontFamily: 'Face',
                      color: Palette.facebookBlue,
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  actions: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade200,
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () => print('search'),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade200,
                        child: IconButton(
                            icon: const Icon(
                              FlutterAppBar.facebook_messenger,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: () => print('message'),
                            iconSize: 25),
                      ),
                    ),
                  ],
                  bottom:  TabBar(
                      indicatorPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        border: cubit.isBottomIndicator
                            ? const Border(
                          bottom: BorderSide(
                            color: Palette.facebookBlue,
                            width: 3.0,
                          ),
                        )
                            : const Border(
                          bottom: BorderSide(
                            color: Palette.facebookBlue,
                            width: 3.0,
                          ),
                        ),
                      ),
                      tabs: cubit.icons
                          .asMap()
                          .map((i, e) => MapEntry(
                        i,
                        Tab(
                          icon: Icon(
                            e,
                            color: i == cubit.selectedIndex
                                ? Palette.facebookBlue
                                : Colors.black45,
                            size: 30.0,
                          ),
                        ),
                      ))
                          .values
                          .toList(),
                      onTap: (index) => cubit.changeTabBar(index)),
                ),
              ];
            },
            body: TabBarView(children: cubit.screens),
          ),
        );
      },
    );
  }
}
