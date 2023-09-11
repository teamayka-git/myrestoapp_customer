import 'package:flutter/material.dart';
import 'package:myresto_customer/my_widgets/AykaCachedNetworkImage/ayka_cached_network_image.dart';

class AykaGroupAvatars extends StatelessWidget {
  const AykaGroupAvatars({
    Key? key,
    required this.aaa,
  }) : super(key: key);

  final List aaa;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...aaa.map(
          (e) => Align(
            widthFactor: 0.5,
            child: CircleAvatar(
              radius: 11,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: AykaCachedNetworkImage(imageUrl: e)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
