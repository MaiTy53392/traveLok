import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Views/EditProfile/EditProfilePage.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelok_vietnam_app/Views/Auth/Login/LoginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            // APP BAR
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      // Write Router
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: constants.AppColor.xGrayBackgroundColor,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 30,
                        color: constants.AppColor.xIconBackgroundColor,
                      ),
                    ),
                  ),
                Container(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: constants.AppColor.xDarkTextColor),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Write Router
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: constants.AppColor.xGrayBackgroundColor,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.edit_calendar,
                      color: constants.AppColor.xBackgroundColor,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),

            // CONTENT
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentUser!.displayName.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: constants.AppColor.xDarkTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    currentUser!.email.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: constants.AppColor.xGrayTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text("Đăng xuất"),
                      onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) {
                          print("Đăng xuất thành công");
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Table(children: [
                      TableRow(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            children: [
                              Text(
                                'Reward Points',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: constants.AppColor.xDarkTextColor),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '360',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: constants.AppColor.xBackgroundColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            children: [
                              Text(
                                'Travel Trips',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: constants.AppColor.xDarkTextColor),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '238',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: constants.AppColor.xBackgroundColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            children: [
                              Text(
                                'Bucket List',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: constants.AppColor.xDarkTextColor),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '473',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: constants.AppColor.xBackgroundColor),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
