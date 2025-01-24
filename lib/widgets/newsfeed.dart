import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/constants.dart';
import '../widgets/customfont.dart';
import '../screens/detail_screen.dart';


class Newsfeed extends StatelessWidget {
  final String userName;
  final String postContent;
  final String? imagePath;
  final String? profileImagePath;
  final int likeCount;
  final bool isLiked;
  final int commentCount;
  final int shareCount;
  final String dateText;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;
  final TextEditingController commentController;
  final Function(String) onCommentChanged;
  final List<Map<String, String>> commentsList;
  

  const Newsfeed({
    super.key,
    required this.userName,
    required this.postContent,
    this.imagePath,
    this.profileImagePath,
    required this.likeCount,
    required this.isLiked,
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              userName: userName,
              postContent: postContent,
              date: dateText,
              numOfLikes: likeCount,
              imagePath: imagePath ?? '',
              profileImagePath: profileImagePath ?? '',
              commentsList: commentsList,
              initialLikes: likeCount,
            ),
          ),
        );
      },
    child: Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(20),
                  backgroundImage: profileImagePath != null
                      ? AssetImage(
                          profileImagePath!) // Using AssetImage for profile
                      : const AssetImage('assets/images/Suguru Geto.png'),
                ),
                SizedBox(width: ScreenUtil().setSp(10)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Customfont(
                        text: userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: FB_PURPLE_WHITE,
                        fontWeight: FontWeight.bold,
                      ),
                      Customfont(
                        text: dateText,
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setSp(10)),
            Customfont(
              text: postContent,
              fontSize: ScreenUtil().setSp(14),
              color: Colors.black,
            ),
            SizedBox(height: ScreenUtil().setSp(10)),
            if (imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setSp(10)),
                child: Image.asset(
                  imagePath!,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            SizedBox(height: ScreenUtil().setSp(10)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: onLikePressed,
                  icon: Icon(
                    Icons.thumb_up,
                    color: isLiked ? FB_PURPLE_WHITE : FB_PURPLE_DARK,
                  ),
                  label: Customfont(
                    text: isLiked ? 'Liked' : 'Like',
                    fontSize: ScreenUtil().setSp(12),
                    color: isLiked ? FB_PURPLE_WHITE : FB_PURPLE_DARK,
                  ),
                ),
                TextButton.icon(
                  onPressed: onCommentPressed,
                  icon: const Icon(
                    Icons.comment,
                    color: FB_PURPLE_DARK,
                  ),
                  label: Customfont(
                    text: 'Comment',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_PURPLE_DARK,
                  ),
                ),
                TextButton.icon(
                  onPressed: onSharePressed,
                  icon: const Icon(
                    Icons.share,
                    color: FB_PURPLE_DARK,
                  ),
                  label: Customfont(
                    text: 'Share',
                    fontSize: ScreenUtil().setSp(12),
                    color: FB_PURPLE_DARK,
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.grey, height: 20),
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
                    controller: commentController,
                    onChanged: onCommentChanged,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      suffixIcon: commentController.text.isNotEmpty
                          ? IconButton(
                              onPressed: onCommentPressed,
                              icon: const Icon(Icons.send),
                            )
                          : null,
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
            if (commentsList.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 238, 238),
                  borderRadius: BorderRadius.circular(ScreenUtil().setSp(10)),
                ),
                padding: EdgeInsets.all(ScreenUtil().setSp(10)),
                margin: EdgeInsets.only(top: ScreenUtil().setSp(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: commentsList.map((comment) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: ScreenUtil().setSp(15),
                            backgroundImage: AssetImage(
                                comment['profileImage'] ??
                                    'assets/images/Suguru Geto.png'),
                          ),
                          SizedBox(width: ScreenUtil().setSp(10)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment['name'] ?? 'Anonymous',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  comment['text'] ??
                                      '', // Correct key for comment text
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    ),
    );
  }
}
