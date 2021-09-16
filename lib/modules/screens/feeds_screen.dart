
import 'package:cpc_task/local%20data/data.dart';
import 'package:cpc_task/models/post_model.dart';
import 'package:cpc_task/shared/widgets/create_post_builder.dart';
import 'package:cpc_task/shared/widgets/post_builder.dart';
import 'package:cpc_task/shared/widgets/rooms.dart';
import 'package:cpc_task/shared/widgets/stories.dart';
import 'package:flutter/material.dart';


class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<FacebookCubit, FacebookStates>(
    //   listener: (context,state) {},
    //   builder: (context,state){
        return CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
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
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories,
                ),
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
    );
  }
}
