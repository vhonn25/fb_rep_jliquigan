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
      'profileImageUrl': 'https://i.ytimg.com/vi/hMtEM2qTNz8/maxresdefault.jpg',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhrrmVNtCZiao_sr1dOeVDAE4YeXe1ddqMw&s',
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
      'profileImageUrl': 'https://pbs.twimg.com/media/ELJt5NKXYAAkxJY.jpg',
      'imageUrl':
          'https://i1.sndcdn.com/artworks-000503802078-irjr2e-t500x500.jpg',
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
      'profileImageUrl': 'https://i.imgur.com/Wn6UWgxg.jpg',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVOrp6ikZhFtAZKCPAVpPPuucIh_s4TcXIYA&s',
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
      'profileImageUrl':
          'https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F38ba0e50-5d43-4f6e-9112-1a10a120b8d5_450x450.jpeg',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Tian%27anmen_from_the_square_%2820200825114150%29.jpg/1200px-Tian%27anmen_from_the_square_%2820200825114150%29.jpg',
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
      'profileImageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
      'imageUrl':
          'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
        itemCount: posts.length +
            (posts.length ~/ 2), // Adjusted item count to insert ads correctly
        itemBuilder: (context, index) {
          if (index % 3 == 2 && index < posts.length + (posts.length ~/ 2)) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Text(
                    "Advertisement",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
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
            int postIndex =
                index - ((index + 1) ~/ 3); // Correct post index calculation
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
              commentsList: List<Map<String, String>>.from(
                  posts[postIndex]["commentsList"]),
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
        'https://1000logos.net/wp-content/uploads/2019/04/Jollibee-logo.jpg',
        'https://queen.jollibee.com.ph/2023/05/2-pc.-Chickenjoy-VM-Promo-min-819x1024.jpg',
        'Chicken Joy Price Drop! Save P36',
      ),
      buildAdCard(
        'PSBank',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAwx9ldG8ie016TBV1J_k8jvLMxSVe528Utg&s',
        'https://www.psbank.com.ph/media/5922/honda-bank-partners-sale-article-image.jpg',
        'Get additional P10,000 discount for Honda cars!',
      ),
      buildAdCard(
        'Smart',
        'https://mcaproperties.com.ph/wp-content/uploads/2018/10/Smart-logo-2016.png',
        'https://n5ecms.tv5.com.ph/wp-content/uploads/2024/08/Smart-ZTE-Blade-A75-Horizontal-720x405.jpg',
        'Get it on Smart Prepaid or Postpaid',
      ),
      buildAdCard(
        'Rolex',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRduaebu1akXlWfkpfynH9hN5Bd5-xoCcwKRg&s',
        'https://i.pinimg.com/736x/f9/8e/3e/f98e3e8e6fa54832fdb51d723a22d819.jpg',
        'The Date just 41',
      ),
      buildAdCard(
        'Nike',
        'https://worksdesigngroup.com/wp-content/uploads/2018/09/Screen-Shot-2018-09-06-at-1.16.15-PM.png',
        'https://imgproxy.divecdn.com/PcvKRVM0Q1izjsun3xkplkiY3akPK_6hq1avV6ODFSg/g:ce/rs:fill:1200:675:1/Z3M6Ly9kaXZlc2l0ZS1zdG9yYWdlL2RpdmVpbWFnZS93ZW1ieS13aWUtY2FtcGFpZ24uanBn.webp',
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
                          userName: "FacebookAd",
                          postContent: "Ad Content",
                          date: "25/25/25",
                          numOfLikes: 0,
                          imageUrl: imageUrl,
                          profileImageUrl: profileUrl,
                        ),
                      ),
                    ),
                    height: 50,
                    width: 50,
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
