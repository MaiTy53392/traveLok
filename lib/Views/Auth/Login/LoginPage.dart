import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Views/Auth/Register/RegisterPage.dart';
import 'package:travelok_vietnam_app/Views/BottomNavigationBar.dart';
import 'package:travelok_vietnam_app/Views/Home/HomePage.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(left: 20, right: 20),
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
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // INPUT PASSWORD
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
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
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: InputDecoration(
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
                  // Write Click Listener Code Here
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
                // Write Click Listener Code Here.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BottomNavBar()));
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
              margin: EdgeInsets.only(top: 40),
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
              margin: EdgeInsets.only(top: 20),
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
                  // Facebook Icon
                  GestureDetector(
                    onTap: () {
                      print('FACEBOOK');
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1627843563095-f6e94676cfe0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bG9nbyUyMGZhY2Vib29rfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                    ),
                  ),
                  const SizedBox(width: 4),
                  // Instagram Icon
                  GestureDetector(
                    onTap: () {
                      print('INSTAGRAM');
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1611262588024-d12430b98920?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bG9nbyUyMGZhY2Vib29rfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                    ),
                  ),
                  const SizedBox(width: 4),
                  // Twitter Icon
                  GestureDetector(
                    onTap: () {
                      print('FACEBOOK');
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1611605698335-8b1569810432?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bG9nbyUyMGZhY2Vib29rfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
