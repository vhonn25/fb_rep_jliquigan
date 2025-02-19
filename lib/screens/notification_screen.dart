import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:facebook_application/widgets/notifications.dart' as notif;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white,
          width: ScreenUtil().screenWidth,
          child: const Column(
            children: [
              notif.Notification(
                userName: 'John Xina',
                postContent: 'What a great EP!',
                description: 'Hello World',
                profileImageUrl: 'assets/images/John Xina.png',
                imageUrl: 'assets/images/Hello World.png',
                dateText: 'August 6',
                numOfLikes: 25,
                commentsList: [],
                likeCount: 25,
              ),
              Divider(),
              notif.Notification(
                userName: 'Ciaran McDonald',
                postContent: 'Unthinkable 1st album. Out Now!',
                description: 'Unthinkable',
                profileImageUrl: 'assets/images/Bearface.png',
                imageUrl: 'assets/images/Unthinkable.png',
                dateText: 'September 12',
                numOfLikes: 50,
                commentsList: [],
                likeCount: 50,
              ),
              Divider(),
              notif.Notification(
                userName: 'Romil Hemnani',
                postContent: 'Loving this new music!',
                description: 'Saturation',
                profileImageUrl: 'assets/images/Romil Hemnani.png',
                imageUrl: 'assets/images/Saturation.png',
                dateText: 'June 9',
                numOfLikes: 10,
                commentsList: [],
                likeCount: 10,
              ),
              Divider(),
              notif.Notification(
                userName: 'Paul Potsky',
                postContent: 'Nothing happened in the Square :))',
                description: 'Tiananmen Square',
                profileImageUrl: 'assets/images/Pol Pot.png',
                imageUrl: 'assets/images/Tiananmen Square.png',
                dateText: 'June 4',
                numOfLikes: 66,
                commentsList: [],
                likeCount: 66,
              ),
              Divider(),
              notif.Notification(
                userName: 'Catto da Sigma',
                postContent: 'Sigma boi sigma boi sigma boi',
                description: 'Sigma boi',
                profileImageUrl: 'assets/images/Sigma Cat.png',
                imageUrl: 'assets/images/Chill Guy.png',
                dateText: 'December 30',
                numOfLikes: 88,
                commentsList: [],
                likeCount: 88,
              ),
              Divider(),
              notif.Notification(
                userName: 'Catto da Sigma',
                postContent: 'Sigma boi sigma boi sigma boi',
                description: 'Sigma boi',
                profileImageUrl: 'assets/images/Sigma Cat.png',
                imageUrl: 'assets/images/Chill Guy.png',
                dateText: 'December 30',
                numOfLikes: 88,
                commentsList: [],
                likeCount: 88,
              ),
              Divider(),
              notif.Notification(
                userName: 'Catto da Sigma',
                postContent: 'Sigma boi sigma boi sigma boi',
                description: 'Sigma boi',
                profileImageUrl: 'assets/images/Sigma Cat.png',
                imageUrl: 'assets/images/Chill Guy.png',
                dateText: 'December 30',
                numOfLikes: 88,
                commentsList: [],
                likeCount: 88,
              ),
              Divider(),
              notif.Notification(
                userName: 'Catto da Sigma',
                postContent: 'Sigma boi sigma boi sigma boi',
                description: 'Sigma boi',
                profileImageUrl: 'assets/images/Sigma Cat.png',
                imageUrl: 'assets/images/Chill Guy.png',
                dateText: 'December 30',
                numOfLikes: 88,
                commentsList: [],
                likeCount: 88,
              ),
              Divider(),
              notif.Notification(
                userName: 'Catto da Sigma',
                postContent: 'Sigma boi sigma boi sigma boi',
                description: 'Sigma boi',
                profileImageUrl: 'assets/images/Sigma Cat.png',
                imageUrl: 'assets/images/Chill Guy.png',
                dateText: 'December 30',
                numOfLikes: 88,
                commentsList: [],
                likeCount: 88,
              ),
              Divider(),
              notif.Notification(
                userName: 'Catto da Sigma',
                postContent: 'Sigma boi sigma boi sigma boi',
                description: 'Sigma boi',
                profileImageUrl: 'assets/images/Sigma Cat.png',
                imageUrl: 'assets/images/Chill Guy.png',
                dateText: 'December 30',
                numOfLikes: 88,
                commentsList: [],
                likeCount: 88,
              ),
              Divider(),
              notif.Notification(
                userName: 'Catto da Sigma',
                postContent: 'Sigma boi sigma boi sigma boi',
                description: 'Sigma boi',
                profileImageUrl: 'assets/images/Sigma Cat.png',
                imageUrl: 'assets/images/Chill Guy.png',
                dateText: 'December 30',
                numOfLikes: 88,
                commentsList: [],
                likeCount: 88,
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
