import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:facebook_application/screens/detail_screen.dart';
import 'package:facebook_application/widgets/constants.dart';
import 'package:facebook_application/widgets/custom_inkwell_button.dart';
import 'package:flutter/material.dart';
import 'package:facebook_application/widgets/postcard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}
 
class _NewsfeedScreenState extends State<NewsfeedScreen> {
  final List<Map<String, dynamic>> posts = [
      {
        'userName': 'John Xina',
        'dateText': 'August 6',
        'postContent': 'What a great EP!',
        'profileImage': 'assets/images/John Xina.png',
        'imageUrl': 'assets/images/Hello World.png',
        'likes': 25,
        'comments': 10,
        'shares': 5,
        'isLiked': false,
        'commentsList': [],
      },
      {
        'userName': 'Ciaran McDonald',
        'dateText': 'September 12',
        'postContent': 'Unthinkable 1st album. Out Now!',
        'profileImage': 'assets/images/Bearface.png',
        'imageUrl': 'assets/images/Unthinkable.png',
        'likes': 50,
        'comments': 30,
        'shares': 15,
        'isLiked': false,
        'commentsList': [],
      },
      {
        'userName': 'Romil Hemnani',
        'dateText': 'June 9',
        'postContent': 'Loving this new music!',
        'profileImage': 'assets/images/Romil Hemnani.png',
        'imageUrl': 'assets/images/Saturation.png',
        'likes': 10,
        'comments': 5,
        'shares': 2,
        'isLiked': false,
        'commentsList': [],
      },
      {
        'userName': 'Paul Potsky',
        'dateText': 'June 4',
        'postContent': 'Nothing happened in the Square :))',
        'profileImage': 'assets/images/Pol Pot.png',
        'imageUrl': 'assets/images/Tiananmen Square.png',
        'likes': 66,
        'comments': 11,
        'shares': 4,
        'isLiked': false,
        'commentsList': [],
      },
      {
        'userName': 'Catto da Sigma',
        'dateText': 'December 30',
        'postContent': 'I\'m just a chill guy fam!',
        'profileImage': 'assets/images/Sigma Cat.png',
        'imageUrl': 'assets/images/Chill Guy.png',
        'likes': 88,
        'comments': 4,
        'shares': 11,
        'isLiked': false,
        'commentsList': [],
      },
    ];
     
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length + (posts.length ~/ 2),
        itemBuilder: (context, index) {
          if (index % 3 == 0 && index != 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Text(
                    "Advertisement",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    height: 308.h,
                  ),
                  items: carouselItems(),
                ),
              ],
            );
          } else {
            int postIndex = index - (index ~/ 3);
            if (postIndex >= posts.length) {
              return const SizedBox();
            }

            return Postcard(
              userName: posts[postIndex]['userName'],
              dateText: posts[postIndex]['dateText'],
              postContent: posts[postIndex]['postContent'],
              profileImagePath: posts[postIndex]['profileImage'],
              imagePath: posts[postIndex]['imageUrl'],
              initialLikeCount: posts[postIndex]['likes'],
              commentCount: posts[postIndex]['comments'],
              shareCount: posts[postIndex]['shares'],
              onLikePressed: () {},
              onCommentPressed: () {},
              onSharePressed: () {},
              commentController: TextEditingController(),
              onCommentChanged: (text) {},
              commentsList: List<Map<String, String>>.from(posts[postIndex]["commentsList"]),
            );
          }
        },
      ),
    );
  }

  List<Widget> carouselItems() {
    return [
      buildAdCard(
        'Globe Telecom',
        'https://companieslogo.com/img/orig/GTMEY-a1d3b2cf.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMgAP5zhqrjyfCeqbN85EaP1qhXPNsf4p06Q&s',
        'Limited Offer! LOAD NOW',
      ),
      buildAdCard(
        'Shopee',
        'https://play-lh.googleusercontent.com/Pc6SYb9QzXb-HV3ZBz1w67bX3_BFOUlTXlbhCK5fhOvOH8rAYZgvkGvxojKZuOubns8=w240-h480-rw',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1Vwcok1zPJPrtcCfuV2Q9chuuW26ic1s2zg&s',
        'Big Discounts Available! BUY NOW',
      ),
      buildAdCard(
        'Samsung Philippines',
        'https://blog.logomaster.ai/hs-fs/hubfs/samsung-logo-1993.jpg?width=672&height=454&name=samsung-logo-1993.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXfDE9AtRbi_1i_ntV8etZ8NCP4BMq_M_e8w&s',
        'Pre-order the new Samsung S23! ORDER NOW',
      ),
    ];
  }


  Widget buildAdCard(
      String company, String profileUrl, String imageUrl, String content) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(profileUrl),
            ),
            title: Text(
              company,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("Sponsored"),
          ),
 
          // ✅ Use `Flexible` to prevent image from pushing down
          Flexible(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
 
          // ✅ Use Padding to give content a margin
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
 
          // ✅ "More Details" Section with Button - Wrap in `SizedBox` to prevent overflow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "More Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  // ✅ Wrap Button in SizedBox to prevent overflow
                  width: 50,
                  height: 40,
                  child: CustomInkwellButton(
                    icon: const Icon(
                      Icons.arrow_right_alt,
                      color: FB_LIGHT_PRIMARY,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          userName: "Placeholder Name",
                          postContent: "Placeholder Content",
                          date: "Date",
                          numOfLikes: 0,
                          imagePath: imageUrl,
                          profileImagePath: profileUrl,
                        ),
                      ),
                    ), height: 50, width: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}