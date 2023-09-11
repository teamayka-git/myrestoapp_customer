import 'package:flutter/material.dart';
import 'package:myresto_customer/constants/custom_colour.dart';

class AykaHorizontalTextViews extends StatelessWidget {
  const AykaHorizontalTextViews(
      {Key? key, required this.firstText, required this.secondText})
      : super(key: key);
  final String firstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: TextStyle(
              color: CustomColors.enabledTextColor,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(secondText,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: CustomColors.disabledTextColor,
                  fontWeight: FontWeight.normal)),
        )
      ],
    );
  }
}
