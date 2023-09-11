import 'package:flutter/material.dart';

class NeomorphicFirstWidget extends StatelessWidget {
  const NeomorphicFirstWidget(
      {Key? key,
      required this.childWidget,
      this.shadowColor = const Color(0xFFF5F5F5),
      this.widgetColor = Colors.white})
      : super(key: key);
  final Widget childWidget;
  final Color shadowColor;
  final Color widgetColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: widgetColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                offset: const Offset(4, 4),
                blurRadius: 5,
                spreadRadius: 0.5),
            const BoxShadow(color: Colors.white)
          ]),
      child: childWidget,
    );
  }
}
