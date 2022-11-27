import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Models/Repository/Repository_Travel.dart';
import 'package:travelok_vietnam_app/ViewModels/TravelController.dart';
import 'package:travelok_vietnam_app/Views/DetailTravel/DetailTravelPage.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class CardTravelG extends StatelessWidget {
  const CardTravelG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    var travelController = TravelController(RepositoryTravel());

    return FutureBuilder(
      future: travelController.fetchTravel(),
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
              },
            ),
          );
        } else {
          return Center(
            child: Text('Loading...'),
          );
        }
      },
    );
  }

}
