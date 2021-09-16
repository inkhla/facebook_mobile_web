import 'package:cpc_task/local%20data/data.dart';
import 'package:cpc_task/models/post_model.dart';
import 'package:cpc_task/shared/widgets/create_post_builder.dart';
import 'package:cpc_task/shared/widgets/left_side_panel.dart';
import 'package:cpc_task/shared/widgets/post_builder.dart';
import 'package:cpc_task/shared/widgets/rightSidePanel.dart';
import 'package:cpc_task/shared/widgets/rooms.dart';
import 'package:cpc_task/shared/widgets/stories.dart';
import 'package:flutter/material.dart';

class WebHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        const Flexible(
          flex: 2,
          child:  LeftSidePanel(currentUser: currentUser),
        ),
        const Spacer(),
        SizedBox(
          width: 600,
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                  child: CreatePostBuilder(
                    currentUser: currentUser,
                  )),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final Post post = posts[index];
                  return PostBuilder(post: post);
                }, childCount: posts.length),
              ),
            ],
            //   );
            // },
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: RightSidePanel(users: onlineUsers),
        ),
      ],
    );
  }
}
