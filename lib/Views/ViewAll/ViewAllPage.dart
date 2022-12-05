import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Models/Repository/Repository_Travel.dart';
import 'package:travelok_vietnam_app/Models/Station_Travel.dart';
import 'package:travelok_vietnam_app/Views/DetailTravel/DetailTravelPage.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class ViewAllPage extends StatefulWidget {
  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
  Text _RatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    return Text(stars);
  }

  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: <Widget>[
            // APPBAR
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
                      'Địa điểm du lịch',
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
            // TITLE TEXT
            Container(
              child: Text(
                'Tất cả địa điểm du lịch',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: constants.AppColor.xDarkTextColor),
              ),
            ),
            // CARD LISTVIEW
            StreamBuilder(
              stream: RepositoryTravel().getTravel(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Travel>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemExtent: 150,
                      itemBuilder: (context, index) {
                        Travel travel = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailTravel(
                                  travel: snapshot.data![index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 6,
                            shadowColor: constants.AppColor.xDarkTextColor
                                .withOpacity(.2),
                            color: constants.AppColor.xOverViewBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  // IMAGE
                                  Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          '${travel.imageUrl}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // CONTENT
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                '${travel.title}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: constants
                                                      .AppColor.xDarkTextColor,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: constants
                                                    .AppColor.xBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text('${travel.price}'),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: constants
                                                  .AppColor.xGrayTextColor,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 1),
                                            Text(
                                              '${travel.country}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: constants
                                                    .AppColor.xGrayTextColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            _RatingStars(1),
                                            const SizedBox(width: 1),
                                            Text(
                                              '${travel.rating}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: constants
                                                    .AppColor.xGrayTextColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            currentUser!.photoURL != null
                                                ? CircleAvatar(
                                                    radius: 10,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      currentUser!.photoURL!
                                                          .toString(),
                                                    ))
                                                : const CircleAvatar(
                                                    radius: 10,
                                                    backgroundImage: NetworkImage(
                                                        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                                                  ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '${travel.price} Person Joined',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: constants
                                                    .AppColor.xGrayTextColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Đã xảy ra lỗi, Hãy thử lại!"),
                  );
                } else {
                  return const Center(
                    child: Text("Loading..."),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
