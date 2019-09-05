import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedRectangle extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color color;
  final EdgeInsetsGeometry margin;

  RoundedRectangle(
      {@required this.child,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0),
      this.borderRadius,
      this.color});

  @override
  Widget build(BuildContext context) {
    var brightColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black38
        : Colors.white30;
    if (color != null) brightColor = color;
    return Container(
      margin: margin,
      padding: padding,
      child: ClipRRect(
        borderRadius: borderRadius != null
            ? borderRadius
            : BorderRadius.all(Radius.circular(8)),
        child: child,
      ),
    );
  }
}

class RoundedBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color color;
  final EdgeInsetsGeometry margin;

  RoundedBackground(
      {@required this.child,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0),
      this.borderRadius,
      this.color});

  @override
  Widget build(BuildContext context) {
    var brightColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.black38
        : Colors.white30;
    if (color != null) brightColor = color;
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius:
              borderRadius != null ? borderRadius : BorderRadius.circular(8),
          color: brightColor),
      child: child,
    );
  }
}

class NetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit boxFit;

  NetworkImage({@required this.imageUrl, this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Icon(Icons.broken_image),
      fit: boxFit,
    );
  }
}
