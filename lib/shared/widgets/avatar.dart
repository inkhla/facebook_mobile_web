import 'package:cpc_task/shared/style/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ProfileAvatar({
  required final String imageUrl,
  final bool isActive = false,
  final bool hasBorder = false,
}) =>
    Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white)),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
