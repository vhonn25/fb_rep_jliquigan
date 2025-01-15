import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/constants.dart';

/// Like Button Widget
class LikeButton extends StatefulWidget {
  final int initialLikeCount;
  final void Function(int newCount) onLikeCountChanged;

  const LikeButton({
    super.key,
    required this.initialLikeCount,
    required this.onLikeCountChanged, required bool isLiked, required Null Function() onLikePressed, required Row child,
  });

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = false; // Default to "not liked"
    likeCount = widget.initialLikeCount; // Initialize with provided count
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked; // Toggle the "liked" state
      likeCount += isLiked ? 1 : -1; // Increment or decrement like count
    });

    // Notify the parent widget of the updated like count
    widget.onLikeCountChanged(likeCount);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleLike,
      child: Row(
        mainAxisSize: MainAxisSize.min, // Takes minimum required space
        children: [
          Icon(
            Icons.thumb_up,
            size: ScreenUtil().setSp(20),
            color: isLiked ? Colors.purple : FB_PURPLE_DARK,
          ),
          SizedBox(width: ScreenUtil().setSp(5)),
          Text(
            isLiked ? "Liked" : "Like", // Toggle text based on "liked" state
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14),
              color: isLiked ? Colors.purple : FB_PURPLE_DARK,
            ),
          ),
          SizedBox(width: ScreenUtil().setSp(10)),
        ],
      ),
    );
  }
}


/// Comment Button Widget
class CommentButton extends StatelessWidget {
  const CommentButton(
      {super.key,
      required void Function() onPressed,
      required bool isCommentSectionVisible,
      required void Function() onCommentPressed, required Row child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize:
          MainAxisSize.min, // Ensures the Row takes the minimum space required
      children: [
        Icon(
          Icons.comment,
          size: ScreenUtil().setSp(20),
          color: FB_PURPLE_DARK,
        ),
        SizedBox(width: ScreenUtil().setSp(5)),
        Text(
          "Comment",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            color: FB_PURPLE_DARK,
          ),
        ),
      ],
    );
  }
}

/// Share Button Widget
class ShareButton extends StatelessWidget {
  final VoidCallback onShare;

  const ShareButton({super.key, required this.onShare});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onShare,
      child: Row(
        mainAxisSize: MainAxisSize
            .min, // Ensures the Row takes the minimum space required
        children: [
          Icon(
            Icons.share,
            size: ScreenUtil().setSp(20),
            color: FB_PURPLE_DARK,
          ),
          SizedBox(width: ScreenUtil().setSp(5)),
          Text(
            "Share",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14),
              color: FB_PURPLE_DARK,
            ),
          ),
        ],
      ),
    );
  }
}
