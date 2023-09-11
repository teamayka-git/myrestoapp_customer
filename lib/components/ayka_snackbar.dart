import 'package:flutter/material.dart';
import 'package:myresto_customer/screen_utils/responsive.dart';

aykaSnackbar(
    {required BuildContext context,
    required String content,
    EnumAykaSnackbar type = EnumAykaSnackbar.error}) {
  var backgroundColor = Colors.white;
  var icon = Icons.info;
  if (type == EnumAykaSnackbar.error) {
    backgroundColor = const Color(0xffbf3544);
    icon = Icons.error;
  } else if (type == EnumAykaSnackbar.info) {
    backgroundColor = const Color(0xff4481b7);
    icon = Icons.info;
  } else if (type == EnumAykaSnackbar.success) {
    backgroundColor = const Color(0xff35694f);
    icon = Icons.done;
  } else if (type == EnumAykaSnackbar.warning) {
    backgroundColor = const Color(0xfff5a957);
    icon = Icons.warning;
  }

  final snackbar = SnackBar(
    content: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Text(
          content,
          style: const TextStyle(color: Colors.white),
        )),
        if (Responsive.isDesktop(context)) ...{
          const SizedBox(width: 10),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ))
        }
      ],
    ),
    backgroundColor: backgroundColor,
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackbar);

  // Flushbar(
  //   endOffset: Offset(.1, 1),
  //   maxWidth: 400,
  //   flushbarPosition: (Responsive.isDesktop(context))
  //       ? FlushbarPosition.TOP
  //       : FlushbarPosition.BOTTOM,
  //   backgroundColor: backgroundColor,
  //   icon: Icon(
  //     icon,
  //     color: Colors.white,
  //   ),
  //   message: content,
  //   mainButton: (Responsive.isDesktop(context) == true)
  //       ? IconButton(
  //           onPressed: () {
  //             Get.back();
  //           },
  //           icon: Icon(
  //             Icons.close,
  //             color: Colors.white,
  //           ),
  //         )
  //       : null,
  //   duration: Duration(seconds: 3),
  // )..show(context);
}

enum EnumAykaSnackbar { info, error, success, warning }
