import 'package:facebook_application/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/home_screen.dart';
import '../screens/newsfeed_screen.dart';

void main() {
  runApp(const FacebookReplication());
}

class FacebookReplication extends StatelessWidget {
  const FacebookReplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook Replication',
          initialRoute: '/home',
          routes: {
            '/newsfeed': (context) => const NewsfeedScreen(),
            '/home': (context) => const HomeScreen(),
            '/notification': (context) => const NotificationScreen()
          },
        );
      },
    );
  }
}
