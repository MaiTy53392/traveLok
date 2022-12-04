import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Views/Auth/Login/LoginPage.dart';
import 'package:travelok_vietnam_app/Views/Onboard/components/Dot.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'components/Content.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late PageController _pageController;

  int _pageDot = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _pageDot = index;
                });
              },
              itemCount: DataOnB.length,
              itemBuilder: (context, index) {
                var dataOnB = DataOnB[index];
                return Column(
                  children: <Widget>[
                    // IMAGE
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(dataOnB.image),
                          fit: BoxFit.cover,
                        ),
                        color: constants.AppColor.xOverViewBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    // CONTENT
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: <Widget>[
                          Text(
                            dataOnB.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: constants.AppColor.xDarkTextColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            dataOnB.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: constants.AppColor.xGrayTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // SKIP
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // IF
                if (_pageDot == 3 - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }
                // Write Click Listener Code Here.
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: constants.AppColor.xGrayTextColor,
                ),
              ),
            ),
          ),
          // BUTTON
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // DOT.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    DataOnB.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: DotIndicator(
                        isActive: index == _pageDot,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    // IF
                    if (_pageDot == 3 - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    }
                    // Write Click Listener Code Here.
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                    height: 65,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          constants.AppColor.xBackgroundColor.withOpacity(.9),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
