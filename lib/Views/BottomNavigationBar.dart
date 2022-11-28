import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'package:travelok_vietnam_app/Views/Calendar/CalendarPage.dart';
import 'package:travelok_vietnam_app/Views/Home/HomePage.dart';
import 'package:travelok_vietnam_app/Views/Message/MessagePage.dart';
import 'package:travelok_vietnam_app/Views/Profile/ProfilePage.dart';
import 'package:travelok_vietnam_app/Views/Search/SearchPage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List pages = [
    HomePage(),
    CalendarPage(),
    MessagePage(),
    ProfilePage()
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.AppColor.xOverViewBackgroundColor,
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage(),),);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: constants.AppColor.xOverViewBackgroundColor,
        selectedItemColor: constants.AppColor.xBackgroundColor,
        unselectedItemColor: constants.AppColor.xGrayTextColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'Lịch trình'),
          BottomNavigationBarItem(icon: Icon(Icons.messenger_outline), label: 'Tin nhắn'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Trang cá nhân'),
        ],
      ),
    );
  }
}

// List pages = [
//   HomePage(),
//   CalendarPage(),
//   SearchPage(),
//   MessagePage(),
//   ProfilePage()
// ];
//
// int currentIndex = 0;
// void onTap(int index) {
//   setState(() {
//     currentIndex = index;
//   });
// }
//
// bottomNavigationBar: BottomNavigationBar(
// type: BottomNavigationBarType.fixed,
// elevation: 10,
// onTap: onTap,
// currentIndex: currentIndex,
// backgroundColor: constants.AppColor.xOverViewBackgroundColor,
// selectedItemColor: constants.AppColor.xBackgroundColor,
// unselectedItemColor: constants.AppColor.xGrayTextColor,
// showSelectedLabels: true,
// showUnselectedLabels: true,
// items: [
// BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
// BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
// BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
// BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
// BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
// ],
// ),
