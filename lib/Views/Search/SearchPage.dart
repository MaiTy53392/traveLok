
import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Models/Repository/Repository_Travel.dart';
import 'package:travelok_vietnam_app/Views/DetailTravel/DetailTravelPage.dart';
import 'package:travelok_vietnam_app/Views/Search/components/CardTravelG.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'package:cloud_firestore/cloud_firestore.dart  ';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String title = '';
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
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                cursorColor: constants.AppColor.xBackgroundColor,
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  hintText: "Tìm kiếm...",
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
            StreamBuilder(
              stream: RepositoryTravel().getTravel(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 260,
                      ),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var travel = snapshot.data?[index];
                        if(title.isEmpty) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailTravel(travel: snapshot.data?[index]),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8,
                              shadowColor: constants.AppColor.xShadowColor,
                              color: constants.AppColor.xOverViewBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // IMAGE
                                    Container(
                                      width: double.infinity,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              '${travel?.imageUrl}',
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    // TITLE CONTENT

                                    // NAME TRAVEL
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 4, right: 4, top: 8),
                                      child: Text(
                                        '${travel?.title}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: constants.AppColor.xDarkTextColor,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // ADDRESS
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: constants.AppColor.xGrayTextColor,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 2),
                                          Text(
                                            "${travel?.country}",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: constants.AppColor.xGrayTextColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    // PRICE PERSON
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 4, right: 4, top: 6),
                                      child: Row(
                                        children: [
                                          Text(
                                            '\$${travel?.price}/',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: constants.AppColor.xBackgroundColor,
                                            ),
                                          ),
                                          Text(
                                            'Person',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: constants.AppColor.xDarkTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        if(travel.title.toString().toLowerCase().startsWith(title.toLowerCase())) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailTravel(travel: travel),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8,
                              shadowColor: constants.AppColor.xShadowColor,
                              color: constants.AppColor.xOverViewBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // IMAGE
                                    Container(
                                      width: double.infinity,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              '${travel?.imageUrl}',
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    // TITLE CONTENT

                                    // NAME TRAVEL
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 4, right: 4, top: 8),
                                      child: Text(
                                        '${travel?.title}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: constants.AppColor.xDarkTextColor,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // ADDRESS
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: constants.AppColor.xGrayTextColor,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 2),
                                          Text(
                                            "${travel?.country}",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: constants.AppColor.xGrayTextColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    // PRICE PERSON
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 4, right: 4, top: 6),
                                      child: Row(
                                        children: [
                                          Text(
                                            '\$${travel?.price}/',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: constants.AppColor.xBackgroundColor,
                                            ),
                                          ),
                                          Text(
                                            'Person',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: constants.AppColor.xDarkTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Loading...'),
                  );
                }
              },
            ),

            // GridVIew
          ],
        ),
      ),
    );
  }
}