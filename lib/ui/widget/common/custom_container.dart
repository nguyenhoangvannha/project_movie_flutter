import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../ui/widget/common/custom_text.dart';

class RoundedBlurContainer extends StatelessWidget {
  final Widget child;
  final Widget trailing;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  RoundedBlurContainer(
      {@required this.child,
        this.color = Colors.black38,
      this.trailing,
      this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color),
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

class RoundedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit boxFit;

  RoundedImage({@required this.imageUrl, this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return RoundedRectangle(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            Center(
              child: CircularProgressIndicator(),
            ),
        errorWidget: (context, url, error) => Icon(Icons.broken_image),
        fit: boxFit,
      ),
    );
  }
}

class RectangleImage extends StatelessWidget {
  final String imageUrl;

  RectangleImage({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          Center(
            child: CircularProgressIndicator(),
          ),
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
        child: TextTitle(
          text: voteAverage.toString(),
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
  final double bottom;
  final double top;
  final EdgeInsetsGeometry padding;

  RoundedRectangle(
      {@required this.child,
        this.bottom = 8,
        this.top = 8,
        this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(top), bottom: Radius.circular(bottom)),
        child: Container(
          padding: padding,
          child: child,
        ));
  }
}
