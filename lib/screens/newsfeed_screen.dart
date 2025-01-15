import 'package:flutter/material.dart';
import '../widgets/newsfeed.dart';

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {
  // State for likes, comments, and shares for each post
  List<bool> likedStates = [];
  List<int> likeCounts = [];
  List<int> commentCounts = [];
  List<int> shareCounts = [];
  List<String> commentText = [];
  List<TextEditingController> commentControllers = [];

  // Sample data for posts with initial counts for likes, comments, and shares
  final List<Map<String, dynamic>> posts = [
    {
      "userName": "John Xina",
      "dateText": "August 6",
      "postContent": "What a great EP!",
      "profileImage": "assets/images/John Xina.png",
      "imageUrl": "assets/images/Hello World.png",
      "likes": 25,
      "isLiked": false,
      "comments": 10,
      "shares": 5,
      "commentsList": [
        {
          "name": "Vhon Liquigan",
          "profileImage": "assets/images/profile1.jpg",
          "text": "Amazing post!",
        },
      ],
    },
    {
      "userName": "Ciaran McDonald",
      "dateText": "September 12",
      "postContent": "Unthinkable 1st album. Out Now!",
      "profileImage": "assets/images/Bearface.png",
      "imageUrl": "assets/images/Unthinkable.png",
      "likes": 50,
      "isLiked": false,
      "comments": 30,
      "shares": 15,
      "commentsList": [],
    },
    {
      "userName": "Romil Hemnani",
      "dateText": "June 9",
      "postContent": "Loving this new music!",
      "profileImage": "assets/images/Romil Hemnani.png",
      "imageUrl": "assets/images/Saturation.png",
      "likes": 10,
      "isLiked": false,
      "comments": 5,
      "shares": 2,
      "commentsList": [],
    },
    {
      "userName": "Paul Potsky",
      "dateText": "June 4",
      "postContent": "Nothing happened in the Tiananmen Square :))",
      "profileImage": "assets/images/Pol Pot.png",
      "imageUrl": "assets/images/Tiananmen Square.png",
      "likes": 66,
      "isLiked": false,
      "comments": 11,
      "shares": 4,
      "commentsList": [],
    },
    {
      "userName": "Catto da Sigma",
      "dateText": "December 30",
      "postContent": "I'm just a chill guy fam!",
      "profileImage": "assets/images/Sigma Cat.png",
      "imageUrl": "assets/images/Chill Guy.png",
      "likes": 88,
      "isLiked": false,
      "comments": 4,
      "shares": 11,
      "commentsList": [],
    },
  ];

  @override
  void initState() {
    super.initState();

    // Initialize the state lists based on the values in posts
    likedStates = posts.map((post) => post["isLiked"] as bool).toList();
    likeCounts = posts.map((post) => post["likes"] as int).toList();
    commentCounts = posts.map((post) => post["comments"] as int).toList();
    shareCounts = posts.map((post) => post["shares"] as int).toList();
    commentText = List.generate(posts.length, (_) => '');
    commentControllers =
        List.generate(posts.length, (_) => TextEditingController());
    for (var post in posts) {
      post["commentsList"] = <Map<String, String>>[];
    }
  }

  // Function to toggle the like button
  void toggleLike(int index) {
    setState(() {
      likedStates[index] = !likedStates[index]; // Toggle like state
      likeCounts[index] +=
          likedStates[index] ? 1 : -1; // Increment or decrement likes
    });
  }

  void incrementComments(int index) {
    setState(() {
      commentCounts[index]++;
    });
  }

  void incrementShares(int index) {
    setState(() {
      shareCounts[index]++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text('Post shared successfully!')),
    );
  }

  void addComment(int index) {
    if (commentText[index].isNotEmpty) {
      setState(() {
        commentCounts[index]++;
        posts[index]["commentsList"].add({
          "name": "Vhon Liquigan",
          "text": commentText[index],
          "profileImage": "assets/images/Suguru Geto.png",
        });
        commentText[index] = '';
        commentControllers[index].clear();
      });
    }
  }

  @override
  void dispose() {
    // Dispose TextEditingControllers to avoid memory leaks
    for (var controller in commentControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Newsfeed(
            userName: posts[index]['userName'],
            dateText: posts[index]['dateText'],
            postContent: posts[index]['postContent'],
            profileImage: posts[index]['profileImage'],
            imageUrl: posts[index]['imageUrl'],
            likeCount: likeCounts[index],
            isLiked: likedStates[index],
            commentCount: commentCounts[index],
            shareCount: shareCounts[index],
            onLikePressed: () => toggleLike(index),
            onCommentPressed: () => addComment(index),
            onSharePressed: () => incrementShares(index),
            commentController: commentControllers[index],
            onCommentChanged: (text) {
              setState(() {
                commentText[index] = text;
              });
            },
            commentsList:
                posts[index]["commentsList"] as List<Map<String, String>>,
          );
        },
      ),
    );
  }
}
