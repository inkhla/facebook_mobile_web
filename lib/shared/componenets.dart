import 'package:cpc_task/models/post_model.dart';
import 'package:cpc_task/shared/style/constants.dart';
import 'package:flutter/material.dart';

Widget createRoomButton() => Container(
  decoration: BoxDecoration(
    color: Palette.facebookBlue.withOpacity(0.15),
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(10),
  ),
  child:   TextButton(
    onPressed: (){print('Create Room');},
    child: const Text('Create Room',style: TextStyle(
        color: Palette.facebookBlue
    ),),
  ),
);


PostImages(Post post)
{
  for(int i = 0 ; i < post.imageUrl!.length ; i++)
  {
    Image(image: NetworkImage(post.imageUrl![i]),);
  }

}