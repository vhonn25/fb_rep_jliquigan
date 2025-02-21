import 'package:cached_network_image/cached_network_image.dart';
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
  final String profileImageUrl;
  const ProfileScreen({super.key, required this.username, required this.profileImageUrl,});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String profileImageUrl = 'https://gdm-assets.b-cdn.net/images/ncavvykf/epicstream/c1e0142f06accc89f5ccdba411b09401a95f0cde-1280x720.jpg?rect=0,26,1280,669&w=398&h=208&auto=format';
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
                        image: CachedNetworkImageProvider('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQyhahkcNF9i-UtMAOBryg2Ao6f2NJ2JIHtv64I9VC4mjagj7mr'),
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
                        CachedNetworkImage(
                          imageUrl: profileImageUrl,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 40,
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
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
                indicatorColor: FB_PURPLE_DARK,
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
                            const SizedBox(height: 20),
                            Postcard(
                              userName: 'Vhon Liquigan',
                              postContent: 'First time playing AFK Journey',
                              profileImageUrl: 'https://gdm-assets.b-cdn.net/images/ncavvykf/epicstream/c1e0142f06accc89f5ccdba411b09401a95f0cde-1280x720.jpg?rect=0,26,1280,669&w=398&h=208&auto=format',
                              imageUrl: 'https://s2.mmommorpg.com/media/sshots/scaled/afk-journey-preview2.jpg.1156x640_q70_crop-smart.jpg',
                              dateText: '12m',
                              commentCount: 2,
                              shareCount: 5,
                              initialLikeCount: 20,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: const [],
                            ),
                            const SizedBox(height: 20),
                            Postcard(
                              userName: 'Vhon Liquigan',
                              postContent: 'I like yaa!',
                              profileImageUrl: 'https://gdm-assets.b-cdn.net/images/ncavvykf/epicstream/c1e0142f06accc89f5ccdba411b09401a95f0cde-1280x720.jpg?rect=0,26,1280,669&w=398&h=208&auto=format',
                              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBvkXMVIMKaf3zr2Og37J5xymgYQYc9fbIyZylIc7QTBiDVuMU',
                              dateText: '1h',
                              commentCount: 2,
                              shareCount: 3,
                              initialLikeCount: 6,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: const [],
                            ),
                            const SizedBox(height: 20),
                            Postcard(
                              userName: 'Vhon Liquigan',
                              postContent: 'I miss them already :(',
                              profileImageUrl: 'https://gdm-assets.b-cdn.net/images/ncavvykf/epicstream/c1e0142f06accc89f5ccdba411b09401a95f0cde-1280x720.jpg?rect=0,26,1280,669&w=398&h=208&auto=format',
                              imageUrl: 'https://media.pitchfork.com/photos/635bd5c994075a586409fc23/master/w_1280%2Cc_limit/Brockhampton-The-Family.jpg',
                              dateText: 'December 22 at 12:27 AM',
                              commentCount: 2,
                              shareCount: 1,
                              initialLikeCount: 11,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: const [],
                            ),
                            const SizedBox(height: 20),
                            Postcard(
                              userName: 'Vhon Liquigan',
                              postContent: 'ThE bEsT y3ar5 of OUR L1v3s',
                              profileImageUrl: 'https://gdm-assets.b-cdn.net/images/ncavvykf/epicstream/c1e0142f06accc89f5ccdba411b09401a95f0cde-1280x720.jpg?rect=0,26,1280,669&w=398&h=208&auto=format',
                              imageUrl: '', // No image
                              dateText: 'December 7 at 3:26 PM',
                              commentCount: 0,
                              shareCount: 0,
                              initialLikeCount: 8,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: const [],
                            ),
                            const SizedBox(height: 20),
                            Postcard(
                              userName: 'Vhon Liquigan',
                              postContent:'Keep a gold chain on my neck, fly as a jet :o',
                              profileImageUrl: 'https://gdm-assets.b-cdn.net/images/ncavvykf/epicstream/c1e0142f06accc89f5ccdba411b09401a95f0cde-1280x720.jpg?rect=0,26,1280,669&w=398&h=208&auto=format',
                              imageUrl: '', // No image
                              dateText: 'December 6 at 10:08 AM',
                              commentCount: 2,
                              shareCount: 3,
                              initialLikeCount: 13,
                              onLikePressed: () {},
                              onCommentPressed: () {},
                              onSharePressed: () {},
                              commentController: TextEditingController(),
                              onCommentChanged: (text) {},
                              commentsList: const [],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const profile_about(),
                    const profile_photos(),
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
