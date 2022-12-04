import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Views/Search/components/CardTravelG.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.AppColor.xOverViewBackgroundColor,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: <Widget>[
            // NAVBAR
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Row(
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
                      'Search',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: constants.AppColor.xDarkTextColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Write Router
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: constants.AppColor.xBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // INPUT SEARCH
            Container(
              alignment: Alignment.center,
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
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Tìm kiếm",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            // CATEGORY
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Địa điểm",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: constants.AppColor.xDarkTextColor,
                ),
              ),
            ),

            //GRIDVIEW
            CardTravelG(),

            // GridVIew
          ],
        ),
      ),
    );
  }
}
