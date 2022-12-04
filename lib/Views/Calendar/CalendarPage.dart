import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

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
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                        Icons.keyboard_arrow_left,
                        color: constants.AppColor.xDarkTextColor,
                        size: 30,
                      ),
                    ),
                  ),
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
                      print('Edit');
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
                        Icons.mode_edit_outline_outlined,
                        color: constants.AppColor.xDarkTextColor,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //CARD LISTVIEW
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemExtent: 100,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      extentRatio: 0.2,
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {}),
                          icon: Icons.edit,
                          foregroundColor: constants.AppColor.xSuccessColor,
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      extentRatio: 0.2,
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: ((context) {}),
                          foregroundColor: constants.AppColor.xErrorColor,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 4,
                      shadowColor:
                          constants.AppColor.xDarkTextColor.withOpacity(.2),
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
                              width: MediaQuery.of(context).size.width * .2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://images.unsplash.com/photo-1579762715118-a6f1d4b934f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // CONTENT
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Tên Phòng",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: constants.AppColor.xDarkTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color:
                                            constants.AppColor.xGrayTextColor,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 1),
                                      Text(
                                        "blablablablabla",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              constants.AppColor.xGrayTextColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
