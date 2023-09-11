import 'package:flutter/material.dart';

class TooltipForProductName extends StatelessWidget {
  const TooltipForProductName(
      {super.key, required this.indexBomItem, required this.message});

  final int indexBomItem;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      textStyle: const TextStyle(
        fontSize: 13,
      ),
      preferBelow: false,
      child: Text(message, maxLines: 2),
    );
  }
}
