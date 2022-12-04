import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Views/BottomNavigationBar.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

import 'package:travelok_vietnam_app/Views/Auth/Register/RegisterPage.dart';
import 'package:travelok_vietnam_app/Views/Auth/ResetPassword/ResetPasswordPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.AppColor.xOverViewBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
                    'Vui lòng đăng nhập tài khoản của bạn',
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
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                controller: _emailTextController,
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: const InputDecoration(
                  hintText: "Email của bạn",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // INPUT PASSWORD
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: constants.AppColor.xGrayBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: constants.AppColor.xShadowColor),
                ],
              ),
              child: TextField(
                obscureText: true,
                controller: _passwordTextController,
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: const InputDecoration(
                  hintText: "Mật khẩu",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // Quên Mật Khẩu
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPassword(),
                    ),
                  );
                },
                child: Text(
                  "Quên mật khẩu?",
                  style: TextStyle(color: constants.AppColor.xBackgroundColor),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // BUTTON Đăng Nhập
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(child: CircularProgressIndicator());
                    });
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavBar()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
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
                  "Đăng nhập",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // REGISTER Click
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn chưa có tài khoản?  ",
                    style: TextStyle(color: constants.AppColor.xGrayTextColor),
                  ),
                  GestureDetector(
                    child: Text(
                      "Đăng ký ngay",
                      style: TextStyle(
                        color: constants.AppColor.xBackgroundColor,
                      ),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),

            // Text Or Connect
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Hoặc đăng nhập",
                style: TextStyle(color: constants.AppColor.xGrayTextColor),
              ),
            ),
            Expanded(child: Container()),
            // Connect Others
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        size: 34,
                      ),
                      onPressed: () async {
                        try {
                          final googleUser = await _googleSignIn.signIn();
                          if( googleUser == null) return;
                          _user = googleUser;

                          final googleAuth = await googleUser.authentication;
                          final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth.accessToken,
                              idToken: googleAuth.idToken
                          );
                          FirebaseAuth.instance.signInWithCredential(credential)
                          .then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const BottomNavBar())));

                        }catch(e) {
                          print(e.toString());
                        }
                      }),
                  const SizedBox(width: 4),
                  // Instagram Icon
                  IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 34,
                      ),
                      onPressed: () {
                        print("Pressed");
                      }),
                  const SizedBox(width: 4),
                  // Twitter Icon
                  IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.apple,
                        size: 34,
                      ),
                      onPressed: () {
                        print("Pressed");
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
