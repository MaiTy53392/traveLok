import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travelok_vietnam_app/Views/EditProfile/EditProfilePage.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelok_vietnam_app/Views/Auth/Login/LoginPage.dart';
import 'package:travelok_vietnam_app/Views/AddProduct/AddProductPage.dart';
import 'package:travelok_vietnam_app/Views/Message/MessagePage.dart';
import 'package:travelok_vietnam_app/Views/Calendar/CalendarPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final googleSignin = GoogleSignIn();
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Write Router
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()));
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
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  currentUser!.photoURL != null
                      ? CircleAvatar(
                      radius: 50,
                      backgroundImage:
                      NetworkImage(currentUser!.photoURL!.toString()))
                      : const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentUser!.displayName!.toString(),
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
                      child: const Text("Đăng xuất"),
                      onPressed: () async {
                        bool isSignedIn = await googleSignin.isSignedIn();
                        isSignedIn == false
                            ? FirebaseAuth.instance.signOut().then((value) {
                          print("Đăng xuất thành công");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const LoginPage()));
                        })
                            : googleSignin.disconnect().then((value) =>
                            FirebaseAuth.instance.signOut().then((value) {
                              print("Đăng xuất thành công");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginPage()));
                            }));
                      },
                    ),
                  ),
                  Table(children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: TextButton(
                          child: const Text("Thêm mới"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const AddProductPage()));
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: TextButton(
                          child: const Text("Địa điểm"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const CalendarPage()));
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: TextButton(
                          child: const Text("Người dùng"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MessagePage()));
                          },
                        ),
                      ),
                    ]),
                  ]),
                  Table(children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Column(
                          children: [
                            Text(
                              'Xác thực',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: constants.AppColor.xDarkTextColor),
                            ),
                            const SizedBox(height: 5),
                            currentUser!.emailVerified
                                ? const Icon(
                              Icons.verified,
                              color: Colors.green,
                            )
                                : const Icon(
                              Icons.highlight_remove,
                              color: Colors.red,
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
                              'Ngày tạo',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: constants.AppColor.xDarkTextColor),
                            ),
                            SizedBox(height: 5),
                            Text(
                              DateFormat('dd/MM/yyyy').format(currentUser!
                                  .metadata.creationTime as DateTime),
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
                              'Đăng nhập',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: constants.AppColor.xDarkTextColor),
                            ),
                            SizedBox(height: 5),
                            Text(
                              DateFormat('dd/MM/yyyy').format(currentUser!
                                  .metadata.lastSignInTime as DateTime),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: constants.AppColor.xBackgroundColor),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ])
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if(currentUser!.emailVerified) {
                      showDialog(context: context, builder: (context) {
                        return const AlertDialog(content: Text("Email của bạn đã xác thực."));
                      });
                    } else {
                      currentUser?.sendEmailVerification();
                      showDialog(context: context, builder: (context) {
                        return const AlertDialog(content: Text("Yêu cầu xác thực thành công! Hãy kiểm tra Email."));
                      });
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      )
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 250.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Gửi Email xác thực",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}