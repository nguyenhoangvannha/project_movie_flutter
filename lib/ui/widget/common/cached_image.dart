import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String? image;
  final BoxFit? fit;
  final placeholder;

  const CachedImage({
    Key? key,
    required this.image,
    this.fit,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.infinity,
      height: double.infinity,
      imageUrl: image!,
      placeholder: (bCtx, url) =>
          _matchParentWidget(const CupertinoActivityIndicator()),
      errorWidget: (bCtx, url, error) =>
          _matchParentWidget(const Icon(Icons.broken_image)),
      fit: fit ?? BoxFit.cover,
    );
  }

  _matchParentWidget(Widget child) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: child,
      ),
    );
  }
}
