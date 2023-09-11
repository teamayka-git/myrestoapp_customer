import 'package:flutter/material.dart';

class AykaHorizontalWidgets extends StatelessWidget {
  const AykaHorizontalWidgets(
      {Key? key, required this.firstWidget, required this.secondWidget})
      : super(key: key);
  final Widget firstWidget;
  final Widget secondWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        firstWidget,
        secondWidget,
      ],
    );
  }
}
