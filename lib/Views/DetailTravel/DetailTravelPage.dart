import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/Models/Station_Travel.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class DetailTravel extends StatelessWidget {
  const DetailTravel({Key? key, required this.travel}) : super(key: key);

  final Travel travel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // IMAGE TRAVEL
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('${travel.imageUrl}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // APPBAR
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
            ),
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
                      color: constants.AppColor.xDarkTextColor.withOpacity(.2),
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
                    '${travel.title}',
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
                      color: constants.AppColor.xDarkTextColor.withOpacity(.2),
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
          // DETAIL
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .6,
              decoration: BoxDecoration(
                color: constants.AppColor.xOverViewBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                      color: constants.AppColor.xDarkTextColor.withOpacity(.2),
                      offset: const Offset(0, -4),
                      blurRadius: 8),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.maximize),
                      color: Colors.grey,
                    ),
                  ),

                  // @1 _ TITLE
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${travel.title}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: constants.AppColor.xDarkTextColor,
                              ),
                            ),
                            Text(
                              '${travel.country}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: constants.AppColor.xGrayTextColor,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                        ),
                      ],
                    ),
                  ),

                  // @2 _ DETAIL
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Country
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
                        // Rating
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
                        // Price
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
                  ),

                  // @3 _ LIST
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Wrap(
                      children: List.generate(5, (index) {
                        return Container(
                          margin: EdgeInsets.all(7),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage('${travel.imageUrl}'),
                                fit: BoxFit.cover,
                              )),
                        );
                      }),
                    ),
                  ),

                  // @4 _ ABOUT
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Giới thiệu về ${travel.title}',
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
                  ),
                  // isEmpty
                  Expanded(child: Container()),
                  // @5 _ Button BOOKNOW
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: GestureDetector(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
