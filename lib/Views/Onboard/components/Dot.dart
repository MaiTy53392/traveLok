import 'package:flutter/material.dart';
import 'package:travelok_vietnam_app/constants.dart' as constants;

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 30 : 10,
      height: 5,
      decoration: BoxDecoration(
          color: isActive ? constants.AppColor.xBackgroundColor : constants.AppColor.xGrayTextColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
