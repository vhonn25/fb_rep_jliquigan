import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:facebook_application/widgets/constants.dart';
import 'package:facebook_application/widgets/buttons.dart';
import 'package:facebook_application/widgets/customfont.dart';

class Postcard extends StatefulWidget {
  final String postId;
  final String userName;
  final String postContent;
  final String? imagePath;
  final String? profileImage;
  final int initialLikeCount;
  final int commentCount;
  final int shareCount;
  final String dateText;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final TextEditingController commentController;
  final Function(String) onCommentChanged;
  final List<Map<String, String>> commentsList;

  const Postcard({
    super.key,
    required this.postId,
    required this.userName,
    required this.postContent,
    this.imagePath,
    this.profileImage,
    required this.initialLikeCount,
    required this.commentCount,
    required this.shareCount,
    required this.dateText,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    required this.commentController,
    required this.onCommentChanged,
    required this.commentsList,
  });

  @override
  _PostcardState createState() => _PostcardState();
}

class _PostcardState extends State<Postcard> {
  late int likeCount = 0;
  late bool isLiked = false;
  late int commentCount;
  late int shareCount;
  late List<String> commentsList = [];

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialLikeCount;
    isLiked = false;
    commentCount = widget.commentCount;
    shareCount = widget.shareCount;
    commentsList = List.from(widget.commentsList);
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked; // Toggle the like state
      likeCount += isLiked ? 1 : -1; // Increment or decrement the like count
    });
  }

  bool isCommentVisible = false; // Add this variable to manage visibility.

  void _toggleCommentSection() {
    setState(() {
      isCommentVisible =
          !isCommentVisible; // Toggle visibility of the comment input.
    });
  }

  void _sendComment() {
    if (widget.commentController.text.isNotEmpty) {
      setState(() {
        widget.commentsList.add({'comment': widget.commentController.text});
        commentCount++; // Increment the comment count.
        widget.commentController.clear(); // Clear the input field.
      });
    }
  }

  void _sharePost() {
    setState(() {
      shareCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text('Post shared successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User profile section
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(20),
                  backgroundImage: widget.profileImage != null
                      ? AssetImage(widget.profileImage!)
                      : const AssetImage('assets/images/Suguru Geto.png'),
                ),
                SizedBox(width: ScreenUtil().setSp(10)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Customfont(
                        text: widget.userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: FB_PURPLE_WHITE,
                        fontWeight: FontWeight.bold,
                      ),
                      Customfont(
                        text: widget.dateText,
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setSp(10)),

            // Post content section
            Customfont(
              text: widget.postContent,
              fontSize: ScreenUtil().setSp(14),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setSp(10)),

            // Image section (if available)
            if (widget.imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setSp(10)),
                child: Image.asset(
                  widget.imagePath!,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            SizedBox(height: ScreenUtil().setSp(10)),

            // Like, Comment, Share statistics
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thumb_up_alt,
                        color: Colors.deepPurple, size: 18),
                    SizedBox(width: ScreenUtil().setSp(5)),
                    Customfont(
                      text: '$likeCount',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade700,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Customfont(
                      text: '$commentCount Comments',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade700,
                    ),
                    SizedBox(width: ScreenUtil().setSp(10)),
                    Customfont(
                      text: '$shareCount Shares',
                      fontSize: ScreenUtil().setSp(12),
                      color: Colors.grey.shade700,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setSp(10)),
            Divider(color: Colors.grey.shade300, thickness: 1),

            // Like, Comment, Share buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LikeButton(
                  initialLikeCount: likeCount,
                  onLikeCountChanged: (newCount) =>
                      setState(() => likeCount = newCount),
                  isLiked: isLiked,
                  onLikePressed: () {
                    _toggleLike(); // This will toggle the like state and update the count.
                    widget
                        .onLikePressed(); // This ensures the callback is also triggered.
                  },
                  child: Row(
                    children: [
                      Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_alt,
                        color: isLiked ? Colors.purple : Colors.grey,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Customfont(
                        text: isLiked ? "Liked" : "Like",
                        fontSize: ScreenUtil().setSp(14),
                        color: isLiked ? Colors.purple : Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '$likeCount', // Display like count
                        style: TextStyle(fontSize: 14, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
                CommentButton(
                  onPressed: _toggleCommentSection,
                  isCommentSectionVisible: isCommentVisible,
                  onCommentPressed: _toggleCommentSection,
                  child: Row(
                    children: [
                      Icon(Icons.comment_outlined,
                          color: Colors.grey, size: 20),
                      SizedBox(width: 5),
                      Customfont(
                        text: "Comment",
                        fontSize: ScreenUtil().setSp(14),
                        color: Colors.grey.shade700,
                      ),
                    ],
                  ),
                ),
                ShareButton(onShare: _sharePost),
              ],
            ),
            const Divider(color: Colors.grey, height: 20),

            // Comment input field
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(15),
                  backgroundImage:
                      const AssetImage('assets/images/Suguru Geto.png'),
                ),
                SizedBox(width: ScreenUtil().setSp(10)),
                Expanded(
                  child: TextField(
                    controller: widget.commentController,
                    onChanged: (value) {
                      setState(() {
                        // Dynamically update the state when the text changes.
                        widget.onCommentChanged(value);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      suffixIcon: widget.commentController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.send,
                                  color: Colors.deepPurple),
                              onPressed:
                                  _sendComment, // Call the send comment function.
                            )
                          : null, // Remove the suffix icon if the text is empty.
                      hintStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setSp(10),
                        horizontal: ScreenUtil().setSp(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setSp(20)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(width: ScreenUtil().setSp(10)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.emoji_emotions_outlined,
                      color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.gif_box_outlined, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.camera_alt_outlined, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Comment section if available
            if (widget.commentsList.isNotEmpty)
              Column(
                children: widget.commentsList.map((comment) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: ScreenUtil().setSp(5)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: ScreenUtil().setSp(15),
                          backgroundImage:
                              const AssetImage('assets/images/Suguru Geto.png'),
                        ),
                        SizedBox(width: ScreenUtil().setSp(10)),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(ScreenUtil().setSp(10)),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.circular(ScreenUtil().setSp(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Customfont(
                                  text: 'Vhon Liquigan', // Added name here
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                Customfont(
                                  text: comment['comment']!,
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
