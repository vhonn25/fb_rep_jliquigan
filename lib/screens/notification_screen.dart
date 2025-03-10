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
                profileImageUrl: 'https://i.ytimg.com/vi/hMtEM2qTNz8/maxresdefault.jpg',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhrrmVNtCZiao_sr1dOeVDAE4YeXe1ddqMw&s',
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
                profileImageUrl: 'https://pbs.twimg.com/media/ELJt5NKXYAAkxJY.jpg',
                imageUrl: 'https://i1.sndcdn.com/artworks-000503802078-irjr2e-t500x500.jpg',
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
                profileImageUrl: 'https://i.imgur.com/Wn6UWgxg.jpg',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVOrp6ikZhFtAZKCPAVpPPuucIh_s4TcXIYA&s',
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
                profileImageUrl: 'https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F38ba0e50-5d43-4f6e-9112-1a10a120b8d5_450x450.jpeg',
                imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Tian%27anmen_from_the_square_%2820200825114150%29.jpg/1200px-Tian%27anmen_from_the_square_%2820200825114150%29.jpg',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
                profileImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnfgb_z6nNZY379b5JTxM-QpbucpdRPdx3A&s',
                imageUrl: 'https://i1.sndcdn.com/artworks-bAq8V5mdeNgSfzW6-qSp9OA-t500x500.png',
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
