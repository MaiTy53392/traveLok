import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Views/BottomNavigationBar.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'package:travelok_vietnam_app/Views/Auth/Login/LoginPage.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPassword createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {

  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.AppColor.xOverViewBackgroundColor,
      resizeToAvoidBottomInset: false,

      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: <Widget>[
            // TOP NAVBAR
            Container(
              alignment: Alignment.topLeft,
              child: GestureDetector(
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
            ),

            // TITLE
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    'TraveloK Vietnam',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: constants.AppColor.xBackgroundColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Đặt lại mật khẩu của bạn',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: constants.AppColor.xGrayTextColor,
                    ),
                  ),
                ],
              ),
            ),

            // INPUT EMAIL
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: constants.AppColor.xGrayBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                controller: _emailTextController,
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: const InputDecoration(
                  hintText: "Email...",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),



            // Sang đăng nhập
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(color: constants.AppColor.xBackgroundColor),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // BUTTON Reset password
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _emailTextController.text)
                    .then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                ));
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  color: constants.AppColor.xBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: const Text(
                  "Đặt lại mật khẩu",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
