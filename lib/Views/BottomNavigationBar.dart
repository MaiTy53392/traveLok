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
  // Active Page (Tab)
  Widget currentIndex = HomePage();
  final PageStorageBucket bucket = PageStorageBucket();

  // Properties
  int currentTab = 0;
  final List<Widget> pages = [
    HomePage(),
    CalendarPage(),
    MessagePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constants.AppColor.xOverViewBackgroundColor,
        body: PageStorage(
          child: currentIndex,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          backgroundColor: constants.AppColor.xBackgroundColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 0,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: constants.AppColor.xOverViewBackgroundColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 0),
                    blurRadius: 10,
                    color: constants.AppColor.xGrayBackgroundColor)
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(
                              () {
                            currentIndex = HomePage();
                            currentTab = 0;
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home_filled,
                            color: currentTab == 0
                                ? constants.AppColor.xBackgroundColor
                                : constants.AppColor.xGrayTextColor,
                          ),
                          Text(
                            'Trang chủ',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? constants.AppColor.xBackgroundColor
                                    : constants.AppColor.xGrayTextColor),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(
                              () {
                            currentIndex = CalendarPage();
                            currentTab = 1;
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.room,
                            color: currentTab == 1
                                ? constants.AppColor.xBackgroundColor
                                : constants.AppColor.xGrayTextColor,
                          ),
                          Text(
                            'Địa điểm',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? constants.AppColor.xBackgroundColor
                                    : constants.AppColor.xGrayTextColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(
                              () {
                            currentIndex = MessagePage();
                            currentTab = 2;
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.supervised_user_circle_sharp,
                            color: currentTab == 2
                                ? constants.AppColor.xBackgroundColor
                                : constants.AppColor.xGrayTextColor,
                          ),
                          Text(
                            'Người dùng',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? constants.AppColor.xBackgroundColor
                                    : constants.AppColor.xGrayTextColor),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(
                              () {
                            currentIndex = ProfilePage();
                            currentTab = 3;
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: currentTab == 3
                                ? constants.AppColor.xBackgroundColor
                                : constants.AppColor.xGrayTextColor,
                          ),
                          Text(
                            'Cá nhân',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? constants.AppColor.xBackgroundColor
                                    : constants.AppColor.xGrayTextColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
