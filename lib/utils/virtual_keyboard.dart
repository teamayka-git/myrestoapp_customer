import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class VirtualKeyboardUtils {
  showKeyBoard(
      Rx<TextEditingController> controller, Function() onKeyPress) async {
    await Get.dialog(
        barrierColor: Colors.transparent,
        Dialog(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                14.0,
              ),
            ),
            child: Container(
              color: Colors.black45,
              child: VirtualKeyboard(
                  textController: controller.value,
                  // Default height is 300
                  height: 350,
                  // Default height is will screen width
                  width: 600,
                  // Default is black
                  textColor: Colors.white,
                  // Default 14
                  fontSize: 20,
                  // the layouts supported
                  // defaultLayouts = [VirtualKeyboardDefaultLayouts.English],
                  // [A-Z, 0-9]
                  type: VirtualKeyboardType.Alphanumeric,
                  onKeyPress: (aaa) {
                    controller.refresh();
                    onKeyPress();
                    //   // setState(() {});
                    //   // print("____i1   $aaa");
                    //   controller.value.text+=aaa.text;
                    // },
                    // Callback for key press event
                    // onKeyPress: () {
                    //   print("____i1");
                  }),
            )

            // Container(
            //   width: 100,
            //   height: 100,
            //   child: Text("ASSA"),
            // )

            ));
  }
}
