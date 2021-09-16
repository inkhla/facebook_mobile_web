import 'package:cpc_task/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'avatar.dart';

class CreatePostBuilder extends StatelessWidget {
  final User currentUser;

  const CreatePostBuilder({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: kIsWeb? 5 : 0),
      elevation: kIsWeb? 1 : 0,
      shape: kIsWeb? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                ProfileAvatar(
                  imageUrl: currentUser.imageUrl,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What\'s on your mind',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(50),
                      ),
                      ),

                  ),
                ),
                )],
            ),
            const SizedBox(
              height: 3,
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      print('Live');
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.videocam,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Live',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 0.5,
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      print('Photo');
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.photo_library,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Photo',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 0.5,
                    color: Colors.grey,
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      print('Room');
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.video_call,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Room',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
