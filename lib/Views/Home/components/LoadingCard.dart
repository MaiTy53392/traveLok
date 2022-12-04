import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class LoadingCard extends StatelessWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
}
