import 'package:flutter/material.dart';

class AykaAlertDialog {
  int? id;
  static appAlertDialog(
    BuildContext context,
    String title,
    Widget alertWidget,
    Function() button1OnTap,
    Function() button2OnTap,
    Widget dropdown,
  ) {
    AlertDialog alert = AlertDialog(
      title: alertWidget,
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(title),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: dropdown,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: button1OnTap,
              icon: const Icon(Icons.clear),
              label: const Text('Cancel'),
            ),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                icon: const Icon(Icons.delete, color: Colors.white),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: button2OnTap),
          ],
        ),
      ],
    );
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
