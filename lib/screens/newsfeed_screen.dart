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
        'profileImageUrl': 'assets/images/John Xina.png',
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
        'profileImageUrl': 'assets/images/Bearface.png',
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
        'profileImageUrl': 'assets/images/Romil Hemnani.png',
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
        'profileImageUrl': 'assets/images/Pol Pot.png',
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
        'profileImageUrl': 'assets/images/Sigma Cat.png',
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
              profileImageUrl: posts[postIndex]['profileImageUrl'],
              imageUrl: posts[postIndex]['imageUrl'],
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
        'Jollibee',
        'assets/images/Jollibee.png',
        'assets/images/Jollideals.png',
        'Chicken Joy Price Drop! Save P36',
      ),
      buildAdCard(
        'PSBank',
        'assets/images/PSBank.png',
        'assets/images/PSBankAd.jpg',
        'Get additional P10,000 discount for Honda cars!',
      ),
      buildAdCard(
        'Smart',
        'assets/images/Smart.png',
        'assets/images/SmartAd.png',
        'Get it on Smart Prepaid or Postpaid',
      ),
      buildAdCard(
        'Rolex',
        'assets/images/Rolex.png',
        'assets/images/RolexAd.png',
        'The Date just 41',
      ),
      buildAdCard(
        'Nike',
        'assets/images/Nike.png',
        'assets/images/NikeAd.png',
        'Just Do It',
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
 
          // Use `Flexible` to prevent image from pushing down
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
 
          // Use Padding to give content a margin
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
 
          // "More Details" Section with Button - Wrap in `SizedBox` to prevent overflow
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
                    color: Colors.black,
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
                          imageUrl: imageUrl,
                          profileImageUrl: profileUrl,
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