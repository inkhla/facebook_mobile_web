import 'package:cpc_task/models/user_model.dart';

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  final String? profileUrl;
  final String? imageUrl;
  final String? imageUrl2;
  final String? imageUrl3;
  final String? imageUrl4;
  final int likes;
  final int comments;
  final int shares;

  const Post({
    this.profileUrl,
    this.imageUrl2,
    this.imageUrl3,
    this.imageUrl4,
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
