import 'package:facebook_application/screens/detail_screen.dart';
import 'package:facebook_application/widgets/custom_inkwell_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:facebook_application/widgets/constants.dart';
import 'package:facebook_application/widgets/buttons.dart';
import 'package:facebook_application/widgets/customfont.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class Postcard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String imageUrl;
  final String profileImageUrl;
  final int initialLikeCount;
  final int commentCount;
  final int shareCount;
  final String dateText;
  final VoidCallback? onLikePressed;
  final VoidCallback? onCommentPressed;
  final VoidCallback? onSharePressed;
  final TextEditingController? commentController;
  final Function(String)? onCommentChanged;
  final List<Map<String, String>>? commentsList;
  final String adsMarket;
  final bool isAds;

  const Postcard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.dateText,
    this.imageUrl = '',
    this.profileImageUrl = '',
    this.initialLikeCount = 0,
    this.commentCount = 0,
    this.shareCount = 0,
    this.onLikePressed,
    this.onCommentPressed,
    this.onSharePressed,
    this.commentController,
    this.onCommentChanged,
    this.commentsList,
    this.adsMarket = '',
    this.isAds = false,
  });

  @override
  // ignore: library_private_types_in_public_api
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
    if (widget.commentsList != null) {
      commentsList = widget.commentsList!.map((commentMap) {
        return commentMap['comment']!;
      }).toList();
    }
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
    if (widget.commentController?.text.isNotEmpty ?? false) {
      setState(() {
        commentsList.add(widget.commentController!.text);
        commentCount++; // Increment the comment count.
        widget.commentController?.clear(); // Clear the input field.
      });
    }
  }

  void _sharePost() {
    setState(() {
      shareCount++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post shared successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                userName: widget.userName,
                postContent: widget.postContent,
                date: widget.dateText,
                numOfLikes: likeCount,
                imageUrl: widget.imageUrl,
                profileImageUrl: widget.profileImageUrl,
                commentsList: widget.commentsList ?? [],
                initialLikes: likeCount,
              ),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.all(ScreenUtil().setSp(10)),
          child: Padding(
            padding: EdgeInsets.all(ScreenUtil().setSp(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (widget.profileImageUrl == '')
                        ? const Icon(Icons.person)
                        : ClipOval(
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              width: 35,
                              height: 35,
                              imageUrl: widget.profileImageUrl,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                color: FB_PURPLE_DARK,
                                value: downloadProgress.progress,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                size: 100.sp,
                              ),
                            ),
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

                // Image section (if available)
                SizedBox(height: ScreenUtil().setHeight(5)),
                Customfont(
                  text: widget.postContent,
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.black,
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                (widget.profileImageUrl == '')
                    ? SizedBox(
                        height: ScreenUtil().setHeight(0.1),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                            color: FB_PURPLE_DARK,
                            value: downloadProgress.progress,
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 100.sp,
                          ),
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
                (widget.adsMarket != '')
                    ? const SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LikeButton(
                            initialLikeCount: likeCount,
                            onLikeCountChanged: (newCount) =>
                                setState(() => likeCount = newCount),
                            isLiked: isLiked,
                            onLikePressed: () {
                              _toggleLike(); // This will toggle the like state and update the count.
                              widget.onLikePressed
                                  ?.call(); // This ensures the callback is also triggered.
                            },
                            child: Row(
                              children: [
                                Icon(
                                  isLiked ? Icons.thumb_up : Icons.thumb_up_alt,
                                  color: isLiked ? Colors.purple : Colors.grey,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                Customfont(
                                  text: isLiked ? "Liked" : "Like",
                                  fontSize: ScreenUtil().setSp(14),
                                  color: isLiked ? Colors.purple : Colors.grey,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '$likeCount', // Display like count
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.purple),
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
                                const Icon(Icons.comment_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
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

                Row(
                  children: [
                    CircleAvatar(
                      radius: ScreenUtil().setSp(15),
                      backgroundImage:
                          const NetworkImage('https://gdm-assets.b-cdn.net/images/ncavvykf/epicstream/c1e0142f06accc89f5ccdba411b09401a95f0cde-1280x720.jpg?rect=0,26,1280,669&w=398&h=208&auto=format'),
                    ),
                    SizedBox(width: ScreenUtil().setSp(10)),
                    Expanded(
                      child: TextField(
                        controller: widget.commentController,
                        onChanged: (value) {
                          setState(() {
                            // Dynamically update the state when the text changes.
                            widget.onCommentChanged?.call(value);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Write a comment...',
                          suffixIcon: widget
                                      .commentController?.text.isNotEmpty ??
                                  false
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
                      icon: const Icon(Icons.gif_box_outlined,
                          color: Colors.grey),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Comment section if available
                if (commentsList.isNotEmpty)
                  Column(
                    children: commentsList.map((comment) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setSp(5)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: ScreenUtil().setSp(15),
                              backgroundImage: const NetworkImage(
                                  'assets/images/Suguru Geto.png'),
                            ),
                            SizedBox(width: ScreenUtil().setSp(10)),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(ScreenUtil().setSp(10)),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil().setSp(10)),
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
                                      text: comment,
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
                (widget.adsMarket != '')
                    ? Container(
                        padding: EdgeInsets.all(5.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Customfont(
                                  text: 'MORE DETAILS',
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                ),
                                Customfont(
                                  text: widget.adsMarket,
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                            CustomInkwellButton(
                              width: 90.w,
                              height: 40.h,
                              icon: const Icon(
                                Icons.arrow_right_alt,
                                color: FB_LIGHT_PRIMARY,
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    userName: widget.userName,
                                    postContent: widget.postContent,
                                    date: widget.dateText,
                                    numOfLikes: likeCount,
                                    imageUrl: widget.imageUrl,
                                    profileImageUrl: widget.profileImageUrl,
                                    commentsList: widget.commentsList ?? [],
                                    initialLikes: likeCount,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                (widget.adsMarket != '')
                    ? const SizedBox()
                    : SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                (widget.adsMarket != '')
                    ? const SizedBox()
                    : Customfont(
                        text: 'View comments',
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
              ],
            ),
          ),
        ));
  }
}
