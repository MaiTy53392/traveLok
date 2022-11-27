import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Models/Station_Travel.dart';
import 'package:travelok_vietnam_app/Views/BottomNavigationBar.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

import '../Home/HomePage.dart';

class DetailTravel extends StatelessWidget {
  const DetailTravel({Key? key, required this.travel}) : super(key: key);

  final Travel travel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            // IMAGE
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${travel.imageUrl}'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            // AppBAR
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
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
                        color: Colors.grey[800],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: constants.AppColor.xOverViewBackgroundColor,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Detail',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: constants.AppColor.xOverViewBackgroundColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Save');
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: constants.AppColor.xDarkTextColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.bookmark_border,
                        color: constants.AppColor.xOverViewBackgroundColor,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                width: MediaQuery.of(context).size.width,
                height: 470,
                decoration: BoxDecoration(
                  color: constants.AppColor.xOverViewBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // View
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            print('View');
                          },
                          icon: Icon(Icons.maximize),
                          color: Colors.grey,
                        )
                      ],
                    ),
                    // TITLE & AVATAR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${travel.title}',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: constants.AppColor.xDarkTextColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'France, Paris',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: constants.AppColor.xGrayTextColor,
                              ),
                            )
                          ],
                        ),
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: constants.AppColor.xGrayTextColor,
                              size: 22,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '${travel.country}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: constants.AppColor.xGrayTextColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "${travel.rating}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: constants.AppColor.xDarkTextColor),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '\$${travel.price}/',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: constants.AppColor.xBackgroundColor),
                            ),
                            Text(
                              'Person',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: constants.AppColor.xGrayTextColor),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      children: List.generate(5, (index) {
                        return Container(
                          margin: EdgeInsets.all(7),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'About Destination',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: constants.AppColor.xDarkTextColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "${travel.description}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: constants.AppColor.xGrayTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Write Click Listener Code Here.
                        print('BOOK');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 65,
                        decoration: BoxDecoration(
                          color: constants.AppColor.xBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: const Text(
                          "Book Now",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
