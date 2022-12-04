import 'package:flutter/cupertino.dart';

class Onboard {
  final String image;
  final String title;
  final String description;
  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> DataOnB = [
  Onboard(
    image:
        "https://images.unsplash.com/photo-1669995128288-20302e5f2313?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNXx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
    title: "Life is short and the world is wide",
    description:
        "As Friends tours and travel, we customize reliable and trustworthy educational tours to destination all over the world",
  ),
  Onboard(
    image:
    "https://images.unsplash.com/photo-1669977555607-821e3cf597ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
    title: "It's a big world out there go explore",
    description:
    "To get the best of your adventure you just need to leave and go where you like. We are waiting gor you",
  ),
  Onboard(
    image:
    "https://images.unsplash.com/photo-1669986884742-87f61afc027d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60",
    title: "People don't take trips, trips take people",
    description:
    "As Friends tours and travel, we customize reliable and trustworthy educational tours to destination all over the world",
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
