import 'package:cpc_task/models/post_model.dart';
import 'package:cpc_task/shared/style/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';

class PostBuilder extends StatelessWidget {
  final Post post;

  const PostBuilder({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
      margin:
          const EdgeInsets.symmetric(vertical: 5, horizontal: kIsWeb ? 5 : 0),
      elevation: kIsWeb ? 1 : 0,
      shape: kIsWeb
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          : null,
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(post: post),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
            post.imageUrl == null && post.profileUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          post.profileUrl.toString(),
                        ),
                          backgroundColor: Colors.transparent,
                      radius: 200,
                    ),
                  )
                :
            post.imageUrl != null || post.imageUrl2 == null || post.imageUrl3 == null || post.imageUrl4 == null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image(
                      image: NetworkImage(
                        post.imageUrl.toString(),
                      ),
                    ),
                  )
                :
            post.imageUrl != null || post.imageUrl2 != null || post.imageUrl3 != null || post.imageUrl4 != null ?
            Column(
              children: [
                Row(
                  children: [
                    Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        post.imageUrl.toString(),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        post.imageUrl2.toString(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        post.imageUrl3.toString(),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        post.imageUrl4.toString(),
                      ),
                    ),
                  ],
                )
              ],
            ) : const SizedBox.shrink(),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: PostStats(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    post.timeAgo,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              print('more options');
            },
            icon: const Icon(Icons.more_horiz_outlined))
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  final Post post;

  const PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            PostButton(
              icon: Icons.thumb_up_alt_outlined,
              label: 'Like',
              onTap: () => print('like'),
            ),
            PostButton(
              onTap: () => print('Comment'),
              icon: Icons.mode_comment_outlined,
              label: 'Comment',
            ),
            PostButton(
              onTap: () => print('Share'),
              icon: Icons.share,
              label: 'Share',
            ),
          ],
        )
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  const PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                const SizedBox(
                  width: 4,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
