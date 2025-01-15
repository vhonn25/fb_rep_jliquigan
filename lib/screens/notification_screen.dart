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
                name: 'John Xina',
                post: 'Hello World EP',
                description: 'What a great EP!',
                imagePath: 'assets/images/John Xina.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Romil Hemnani',
                post: 'Drip beats',
                description: 'This is so cool! 😂',
                imagePath: 'assets/images/Romil Hemnani.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Paul Potsky',
                post: 'How to make a utopia world',
                description: 'Step 1...',
                imagePath: 'assets/images/Pol Pot.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Ciaran McDonald',
                post: 'New Orleans',
                description: 'Stop callin my stage name',
                imagePath: 'assets/images/Bearface.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Catto da Sigma',
                post: 'Sigma boi',
                description: 'Sigma boi sigma boi sigma boi',
                imagePath: 'assets/images/Sigma Cat.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Catto da Sigma',
                post: 'Sigma boi',
                description: 'Sigma boi sigma boi sigma boi',
                imagePath: 'assets/images/Sigma Cat.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Catto da Sigma',
                post: 'Sigma boi',
                description: 'Sigma boi sigma boi sigma boi',
                imagePath: 'assets/images/Sigma Cat.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Catto da Sigma',
                post: 'Sigma boi',
                description: 'Sigma boi sigma boi sigma boi',
                imagePath: 'assets/images/Sigma Cat.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Catto da Sigma',
                post: 'Sigma boi',
                description: 'Sigma boi sigma boi sigma boi',
                imagePath: 'assets/images/Sigma Cat.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Catto da Sigma',
                post: 'Sigma boi',
                description: 'Sigma boi sigma boi sigma boi',
                imagePath: 'assets/images/Sigma Cat.png',
              ),
              Divider(),
              notif.Notification(
                name: 'Catto da Sigma',
                post: 'Sigma boi',
                description: 'Sigma boi sigma boi sigma boi',
                imagePath: 'assets/images/Sigma Cat.png',
              ),
              Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
