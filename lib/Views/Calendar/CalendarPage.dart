import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;
import 'package:travelok_vietnam_app/Models/Repository/Repository_Travel.dart';
import 'package:travelok_vietnam_app/Views/DetailTravel/DetailTravelPage.dart';
import 'package:travelok_vietnam_app/Models/Station_Travel.dart';
import 'package:travelok_vietnam_app/Views/AddProduct/AddProductPage.dart';
import 'package:travelok_vietnam_app/Views/UpdateProduct/UpdateProductPage.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.AppColor.xOverViewBackgroundColor,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: <Widget>[
            // NAVBAR
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 45, height: 45, child: Text("")),
                  Container(
                    child: Text(
                      'Quản lý phòng',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: constants.AppColor.xDarkTextColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddProductPage()));
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color:
                            constants.AppColor.xDarkTextColor.withOpacity(.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: constants.AppColor.xDarkTextColor,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: RepositoryTravel().getTravel(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Travel>> snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemExtent: 100,
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
                            child: Slidable(
                              startActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: ((context) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UpdateProductPage(
                                            travel: snapshot.data![index],
                                          ),
                                        ),
                                      );
                                    }),
                                    icon: Icons.edit,
                                    foregroundColor:
                                        constants.AppColor.xSuccessColor,
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: ((context) {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Xoá Địa điểm du lịch?"),
                                              content: const Text(
                                                  "Bạn chuẩn bị xoá một địa điểm du dịch. Bạn có chắc?"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: const Text("Không")),
                                                TextButton(
                                                    onPressed: () async {
                                                      var id = travel.id;
                                                      RepositoryTravel()
                                                          .deleteTravel(id!)
                                                          .then((_) =>
                                                              Navigator.of(ctx)
                                                                  .pop());
                                                    },
                                                    child: const Text("Xoá"))
                                              ],
                                            );
                                          });
                                    }),
                                    foregroundColor:
                                        constants.AppColor.xErrorColor,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              child: Card(
                                elevation: 4,
                                shadowColor: constants.AppColor.xDarkTextColor
                                    .withOpacity(.2),
                                color: constants.AppColor.xGrayBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: <Widget>[
                                      // IMAGE
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '${travel.title}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: constants
                                                    .AppColor.xDarkTextColor,
                                              ),
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
                                                    color: constants.AppColor
                                                        .xGrayTextColor,
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
                }),
            //CARD LISTVIEW
          ],
        ),
      ),
    );
  }
}
