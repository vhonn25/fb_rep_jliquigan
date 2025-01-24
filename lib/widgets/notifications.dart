import 'package:facebook_application/screens/detail_screen.dart';
import 'package:facebook_application/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notification extends StatelessWidget {
  const Notification({
    super.key,
    required this.userName,
    required this.postContent,
    required this.description,
    this.icon = const Icon(Icons.person),
    this.profileImagePath = '',
    this.atProfile = false,
    required this.dateText,
    this.imagePath = '',
    required this.numOfLikes,
    required this.likeCount,
    required this.commentsList,
  });

  final String userName;
  final String postContent;
  final String description;
  final Icon icon;
  final String profileImagePath;
  final String dateText;
  final int likeCount;
  final int numOfLikes;
  final String imagePath;
  final bool atProfile;
  final List<Map<String, String>> commentsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: InkWell(
        onTap: () {
          (atProfile)
              ? print('')
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      userName: userName,
                      postContent: postContent,
                      date: dateText,
                      numOfLikes: numOfLikes,
                      imagePath: imagePath,
                      profileImagePath: profileImagePath,
                      commentsList: commentsList,
                      initialLikes: likeCount,
                    ),
                  ),
                );
        },
        child: Row(
          children: [
            (profileImagePath == '')
                ? icon
                : CircleAvatar(
                    radius: ScreenUtil().setSp(15),
                    backgroundImage: AssetImage(profileImagePath),
                  ),
            SizedBox(
              width: ScreenUtil().setWidth(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customfont(
                  text: userName,
                  fontSize: ScreenUtil().setSp(20),
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                Customfont(
                  text: 'Posted: $postContent',
                  fontSize: ScreenUtil().setSp(13),
                  color: Colors.black,
                ),
                Customfont(
                  text: description,
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                Customfont(
                  text: dateText,
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.grey.shade400,
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}
