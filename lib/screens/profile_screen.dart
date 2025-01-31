import 'package:facebook_application/widgets/constants.dart';
import 'package:facebook_application/widgets/custom_button.dart';
import 'package:facebook_application/widgets/customfont.dart';
import 'package:facebook_application/widgets/postcard.dart';
import 'package:facebook_application/widgets/profile_about.dart';
import 'package:facebook_application/widgets/profile_photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  const ProfileScreen({super.key, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    // Debug: Print received username
    print('ProfileScreen Username: ${widget.username}');
  }

  Map<String, int> likeCounts = {
    'post1': 20,
    'post2': 6,
    'post3': 11,
    'post4': 8,
    'post5': 13,
  };

  // This function will handle the like button press
  void _onLikePressed(String postId) {
    setState(() {
      likeCounts[postId] =
          (likeCounts[postId] ?? 0) + 1; // Increment like count
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/JJK Trio.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: ScreenUtil().setWidth(20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/Suguru Geto.png'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(55)),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customfont(
                      text:  widget.username,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20),
                      color: Colors.black,
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    Row(
                      children: [
                        Customfont(
                          text: '5K',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        Customfont(
                          text: 'friends',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        Customfont(
                          text: '7',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(5)),
                        Customfont(
                          text: 'following',
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.grey,
                          fontWeight: FontWeight.w100,
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10)),
                    Row(
                      children: [
                        CustomButton(
                          buttonName: 'Follow',
                          onPressed: () {},
                        ),
                        SizedBox(width: ScreenUtil().setWidth(10)),
                        CustomButton(
                          buttonName: 'Message',
                          onPressed: () {},
                          buttonType: 'outlined',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              TabBar(
                indicatorColor: FB_DARK_PRIMARY,
                tabs: [
                  Tab(
                    child: Customfont(
                      text: 'Posts',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    child: Customfont(
                      text: 'About',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    child: Customfont(
                      text: 'Photos',
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                // Post Section
                height: ScreenUtil().setHeight(2000),
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Postcard(
                              postId: 'post1',
                              userName: 'Vhon Liquigan',
                              postContent: 'First time playing AFK Journey',
                              profileImage: 'assets/images/Suguru Geto.png',
                              imagePath: 'assets/images/AFK Journey.png',
                              dateText: '12m',
                              commentCount: 2,
                              shareCount: 5,
                              initialLikeCount: 20,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: [],
                            ),
                            SizedBox(height: 20),
                            Postcard(
                              postId: 'post2',
                              userName: 'Vhon Liquigan',
                              postContent: 'I like yaa!',
                              profileImage: 'assets/images/Suguru Geto.png',
                              imagePath: 'assets/images/Red Guitar.png',
                              dateText: '1h',
                              commentCount: 2,
                              shareCount: 3,
                              initialLikeCount: 6,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: [],
                            ),
                            SizedBox(height: 20),
                            Postcard(
                              postId: 'post3',
                              userName: 'Vhon Liquigan',
                              postContent: 'I miss them already :(',
                              profileImage: 'assets/images/Suguru Geto.png',
                              imagePath: 'assets/images/The Family.png',
                              dateText: 'December 22 at 12:27 AM',
                              commentCount: 2,
                              shareCount: 1,
                              initialLikeCount: 11,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: [],
                            ),
                            SizedBox(height: 20),
                            Postcard(
                              postId: 'post4',
                              userName: 'Vhon Liquigan',
                              postContent: 'ThE bEsT y3ar5 of OUR L1v3s',
                              profileImage: 'assets/images/Suguru Geto.png',
                              imagePath: null, // No image
                              dateText: 'December 7 at 3:26 PM',
                              commentCount: 0,
                              shareCount: 0,
                              initialLikeCount: 8,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: [],
                            ),
                            SizedBox(height: 20),
                            Postcard(
                              postId: 'post5',
                              userName: 'Vhon Liquigan',
                              postContent:
                                  'Keep a gold chain on my neck, fly as a jet :o',
                              profileImage: 'assets/images/Suguru Geto.png',
                              imagePath: null, // No image
                              dateText: 'December 6 at 10:08 AM',
                              commentCount: 2,
                              shareCount: 3,
                              initialLikeCount: 13,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: [],
                            ),
                          ],
                        ),
                      ),
                    ),
                    profile_about(),
                    profile_photos(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
