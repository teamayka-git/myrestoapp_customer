import 'package:flutter/material.dart';

class AykaDefaultProgressbarWidget extends StatelessWidget {
  const AykaDefaultProgressbarWidget(
      {Key? key,
      this.size = 25,
      this.stokWidth = 2.5,
      this.color = Colors.white})
      : super(key: key);
  final double size;
  final double stokWidth;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: stokWidth,
        color: color,
      ),
    );
  }
}
