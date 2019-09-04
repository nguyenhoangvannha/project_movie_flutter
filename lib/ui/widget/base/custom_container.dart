import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../ui/widget/base/custom_text.dart';

class RoundedBlurContainer extends StatelessWidget {
  final Widget child;
  final Widget trailing;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  RoundedBlurContainer(
      {@required this.child,
      this.color,
      this.trailing,
      this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color ?? Colors.black38),
        child: Row(
          mainAxisAlignment: mainAxisAlignment != null
              ? mainAxisAlignment
              : trailing != null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
          children: <Widget>[
            child,
            if (trailing != null) trailing,
          ],
        ));
  }
}

class RoundedCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  RoundedCachedNetworkImage({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return RoundedRectangle(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => RefreshProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.broken_image),
        fit: BoxFit.cover,
      ),
    );
  }
}

class RectangleCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  RectangleCachedNetworkImage({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => RefreshProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.broken_image),
      fit: BoxFit.cover,
    );
  }
}

class VoteAverage extends StatelessWidget {
  final double voteAverage;

  VoteAverage(this.voteAverage);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: RoundedBlurContainer(
        child: TextTitleWhite(
          text: voteAverage.toString(),
          color: Colors.yellow,
        ),
        color: Colors.white24,
        trailing: Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ),
    );
  }
}

class RoundedRectangle extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double bottom;
  final double top;
  final EdgeInsetsGeometry padding;
  final Color color;

  RoundedRectangle(
      {@required this.child,
      this.borderRadius = 8,
      this.top = 0,
      this.bottom = 0,
      this.padding,
      this.color});

  RoundedRectangle.only(
      {@required this.child,
      this.borderRadius = 0,
      this.top = 0,
      this.bottom = 0,
      this.padding,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius > 0
            ? BorderRadius.circular(borderRadius)
            : bottom > 0
                ? BorderRadius.vertical(
                    top: Radius.circular(0), bottom: Radius.circular(bottom))
                : BorderRadius.vertical(
                    top: Radius.circular(top), bottom: Radius.circular(0)),
        child: Container(
          color: color ?? Colors.black38,
          padding: padding ?? EdgeInsets.all(0),
          child: child,
        ));
  }
}
