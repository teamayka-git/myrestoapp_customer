import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

aykaOkToast(String content) {
  showToast(
    content,
    position: ToastPosition.bottom,
    backgroundColor: Colors.black.withOpacity(0.8),
    radius: 13.0,
    textPadding: const EdgeInsets.all(10),
    textStyle: const TextStyle(fontSize: 18.0, color: Colors.white),
    // animationBuilder: const Miui10AnimBuilder(),
  );
}
