import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class AykaCachedNetworkImage extends StatelessWidget {
  const AykaCachedNetworkImage(
      {Key? key, required this.imageUrl, this.fit = BoxFit.cover})
      : super(key: key);
  final String imageUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => (kIsWeb)
          ? Image.asset("assets/gif/place_holder.gif")
          : Lottie.asset(
              "assets/lottie_files/network_cached_imageview/lottie_image_place_holder.json"),
      errorWidget: (context, url, error) => (kIsWeb)
          ? Image.asset("assets/gif/image_error.gif")
          : Lottie.asset(
              "assets/lottie_files/network_cached_imageview/lottie_image_error.json"),
    );
  }
}
