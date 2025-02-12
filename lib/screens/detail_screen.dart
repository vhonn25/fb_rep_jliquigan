import 'package:facebook_application/widgets/constants.dart';
import 'package:facebook_application/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  int numOfLikes;
  final String imageUrl;
  final String profileImageUrl;
  final int initialLikes;
  final List<Map<String, String>> commentsList;

  DetailScreen({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    required this.date,
    this.imageUrl = '',
    this.profileImageUrl = '',
    this.initialLikes = 0,
    this.commentsList = const [],
  });

  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int likes = 0;
  bool isLiked = false;
  List<Map<String, String>> comments = [];
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
    comments =
        List.from(widget.commentsList); // Initialize with passed comments
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  void addComment() {
    if (commentController.text.trim().isNotEmpty) {
      setState(() {
        comments.add({
          "name": "Vhon Liquigan", // Replace with dynamic user data
          "text": commentController.text.trim(),
          "profileImageUrl": "assets/images/Suguru Geto.png", // Example image path
        });
        commentController.clear();
      });
    }
  }

  void sharePost() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post shared successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Customfont(
          text: widget.userName,
          fontSize: ScreenUtil().setSp(20),
          color: Colors.black,
        ),
      ),
      body: Container(
        color: Colors.white,
        height: ScreenUtil().screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              (widget.imageUrl == '')
                  ? SizedBox(
                      height: ScreenUtil().setHeight(0),
                    )
                  : Image.asset(widget.imageUrl),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (widget.profileImageUrl.isEmpty)
                        ? const Icon(Icons.person)
                        : CircleAvatar(
                            radius: ScreenUtil().setSp(25),
                            backgroundImage:
                                AssetImage(widget.profileImageUrl),
                          ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Customfont(
                          text: widget.userName,
                          fontSize: ScreenUtil().setSp(20),
                          color: FB_PURPLE_WHITE,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Customfont(
                              text: widget.date,
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(3),
                            ),
                            Icon(
                              Icons.public,
                              color: Colors.grey,
                              size: ScreenUtil().setSp(18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                alignment: Alignment.centerLeft,
                child: Customfont(
                  text: widget.postContent,
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              const Divider(),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: toggleLike,
                      icon: Icon(
                        Icons.thumb_up,
                        color: isLiked ? FB_PURPLE_PRIMARY : FB_PURPLE_DARK,
                      ),
                      label: Customfont(
                        text: likes.toString(),
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_PURPLE_DARK,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment, color: FB_PURPLE_DARK),
                      label: Customfont(
                        text: 'Comment',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_PURPLE_DARK,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: sharePost,
                      icon: const Icon(Icons.redo, color: FB_PURPLE_DARK),
                      label: Customfont(
                        text: 'Share',
                        fontSize: ScreenUtil().setSp(12),
                        color: FB_PURPLE_DARK,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                child: Column(
                  children: [
                    ...comments.map((comment) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(comment["profileImageUrl"]!),
                        ),
                        title: Text(comment["name"]!),
                        subtitle: Text(comment["text"]!),
                      );
                    }),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: commentController,
                            decoration: const InputDecoration(
                              hintText: 'Write a comment...',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: FB_PURPLE_DARK),
                          onPressed: addComment,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


