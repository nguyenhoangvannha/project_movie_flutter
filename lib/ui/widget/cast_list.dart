import 'package:flutter/material.dart';

class CastList extends StatelessWidget {
  final String _listTitle;
  final int _movieId;

  CastList(this._listTitle, this._movieId);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
//class CastList extends StatelessWidget {
//  final String _listTitle;
//  final int _movieId;
//
//  CastList(this._listTitle, this._movieId);
//
//  @override
//  Widget build(BuildContext context) {
//    final bool isPortrail =
//        MediaQuery.of(context).orientation == Orientation.portrait;
//    return LayoutBuilder(
//      builder: (ctx, constraints) {
//        double width = constraints.maxWidth;
//        double height = MediaQuery.of(context).size.height;
//        return Column(
//          children: <Widget>[
//            ListTile(
//                contentPadding: EdgeInsets.all(0),
//                title: Text(
//                  _listTitle,
//                  style: Theme.of(context).textTheme.title,
//                )),
//            Container(
//                width: width,
//                height: isPortrail ? height * 0.2 : height * 0.4,
//                child: WidgetUtils.getFutureBuilder(
//                    future: Provider.of<Casts>(context, listen: false)
//                        .loadCredits(),
//                    child: Consumer<Casts>(
//                      builder: (cCtx, castsData, child) {
//                        final casts = castsData.items;
//                        return ListView.builder(
//                            scrollDirection: Axis.horizontal,
//                            itemCount: casts.length,
//                            itemBuilder: (context, index) {
//                              var cast = casts.elementAt(index);
//                              return Container(
//                                width: isPortrail ? width * 0.25 : width * 0.2,
//                                child: CastListItem(
//                                    title: cast.name,
//                                    imageUrl: cast.profilePath),
//                              );
//                            });
//                      },
//                    )))
//          ],
//        );
//      },
//    );
//  }
//}
