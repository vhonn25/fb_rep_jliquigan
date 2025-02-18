import 'package:facebook_application/screens/notification_screen.dart';
import 'package:facebook_application/widgets/custom_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/constants.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/customfont.dart';
import 'package:facebook_application/screens/profile_screen.dart';
import '../screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  String? _username;

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
    });
    ('Retrieved Username: $_username');
  }

  @override
  void initState() {
    super.initState();
    _username = widget.username; // Set the username from the constructor
    _loadUsername(); // Optional: Load persisted username if needed
  }

  // ignore: unused_element
  void _logout() {
    // Navigate to LoginScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: PURPLE_TEXT_COLOR_WHITE,
        elevation: 2,
        title: Customfont(
          text: _selectedIndex == 0
              ? 'Vhonship'
              : _selectedIndex == 1
                  ? 'Notifications'
                  : widget.username,
          fontSize: ScreenUtil().setSp(25),
          color: FB_PURPLE_PRIMARY,
          fontFamily: 'Klavika',
        ),
        actions: [
          IconButton(
            onPressed: () => customOptionDialog(context,
                onYes: () => Navigator.pushReplacementNamed(context, '/login'),
                title: 'Logout',
                content: 'Are you sure you want to logout?'),
            icon: const Icon(Icons.logout, color: FB_LIGHT_PRIMARY),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          const NewsfeedScreen(),
          const NotificationScreen(),
          ProfileScreen(
            username: widget.username,
            profileImageUrl: '',
          ),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: FB_PURPLE_WHITE,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}


