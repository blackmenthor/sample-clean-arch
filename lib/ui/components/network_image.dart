import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    Key? key,
    this.emptyImage,
    required this.imageUrl,
    this.radius = 8,
    required this.size,
  }) : super(key: key);

  final Widget? emptyImage;
  final String? imageUrl;
  final double radius;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.isEmpty ?? true) {
      return emptyImage ?? const SizedBox();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: FancyShimmerImage(
        imageUrl: imageUrl!,
        height: size,
        width: size,
        errorWidget: emptyImage ?? const SizedBox(),
      ),
      // child: CachedNetworkImage(
      //   imageUrl: imageUrl!,
      //   height: size,
      //   width: size,
      //   fit: BoxFit.cover,
      //   errorWidget: (_, __, ___) {
      //     return emptyImage ?? const SizedBox();
      //   },
      //   placeholder: (_, __) {
      //     return Shimmer.fromColors(
      //         baseColor: Colors.grey,
      //         highlightColor: Colors.grey,
      //         child: ClipRRect(
      //           borderRadius: BorderRadius.circular(radius),
      //           child: SizedBox(
      //             height: size,
      //             width: size,
      //           ),
      //         ),
      //     );
      //   },
      // ),
    );
  }
}
