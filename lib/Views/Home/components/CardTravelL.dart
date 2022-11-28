import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Models/Repository/Repository_Travel.dart';
import 'package:travelok_vietnam_app/ViewModels/TravelController.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'package:travelok_vietnam_app/Views/DetailTravel/DetailTravelPage.dart';

class CardTravelL extends StatelessWidget {
  const CardTravelL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    var travelController = TravelController(RepositoryTravel());

    return FutureBuilder(
      future: travelController.fetchTravel(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return Container(
            height: 450,
            child: ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemExtent: 300,
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final travel = snapshot.data?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailTravel(travel: snapshot.data?[index],),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.black12,
                    color: constants.AppColor.xOverViewBackgroundColor,
                    margin: const EdgeInsets.only(right: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          // IMAGE
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    '${travel?.imageUrl}',
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 16,
                                  top: 16,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('SAVE');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: constants
                                              .AppColor.xBlackBackgroundColor,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.bookmark_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // CONTENT 1
                          Container(
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${travel?.title}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: constants.AppColor.xDarkTextColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      "${travel?.rating}",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                        constants.AppColor.xDarkTextColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          // CONTENT 2
                          Container(
                            margin: const EdgeInsets.only(
                                left: 4, right: 8, top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
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
                                          fontSize: 14,
                                          color: constants
                                              .AppColor.xGrayTextColor),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: constants
                                              .AppColor.xBackgroundColor,
                                          shape: BoxShape.circle),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            height: 450,
            child: ListView.builder(
              itemCount: 10,
              itemExtent: 300,
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  shadowColor: Colors.black12,
                  color: constants.AppColor.xOverViewBackgroundColor,
                  margin: const EdgeInsets.only(right: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        // IMAGE
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: constants.AppColor.xGrayBackgroundColor),
                        ),
                        // CONTENT 1
                        Container(
                          margin:
                              const EdgeInsets.only(left: 8, right: 8, top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 16,
                                decoration: BoxDecoration(
                                    color:
                                        constants.AppColor.xGrayBackgroundColor,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: constants
                                            .AppColor.xGrayBackgroundColor,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  const SizedBox(width: 2),
                                  Container(
                                    width: 25,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        color: constants
                                            .AppColor.xGrayBackgroundColor,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // CONTENT 2
                        Container(
                          margin:
                              const EdgeInsets.only(left: 8, right: 8, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: constants
                                            .AppColor.xGrayBackgroundColor,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  const SizedBox(width: 2),
                                  Container(
                                    width: 120,
                                    height: 14,
                                    decoration: BoxDecoration(
                                        color: constants
                                            .AppColor.xGrayBackgroundColor,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: constants
                                            .AppColor.xGrayBackgroundColor,
                                        shape: BoxShape.circle),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
