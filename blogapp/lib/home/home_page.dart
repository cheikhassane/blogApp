import 'package:blogapp/Notification/view/notification_view.dart';
import 'package:blogapp/page/preference_view.dart';
import 'package:blogapp/post/view/post_view.dart';
import 'package:blogapp/user/view/user_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Widget callPage(int currentIndex) {
    switch (_currentIndex) {
      case 0:
        return const PostView();
      case 1:
        return const NotificationView();
      case 2:
        return const PreferenceView();
      default:
        const PostView();
    }

    return callPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            // backgroundColor: Couleur.backgroundapp,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: "Notification",
            // backgroundColor: Couleur.backgroundapp,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Preference",
            // backgroundColor: Couleur.backgroundapp,
          ),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
