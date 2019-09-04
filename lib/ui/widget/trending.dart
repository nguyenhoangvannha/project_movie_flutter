import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/bloc/trending/bloc.dart';

import 'common/custom_text.dart';
import 'movie_grid.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  TrendingBloc _trendingBloc;

  @override
  void initState() {
    super.initState();
    _trendingBloc = BlocProvider.of<TrendingBloc>(context);
    _trendingBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(
      builder: (context, state) {
        if (state is TrendingError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is TrendingLoaded) {
          if (state.movies.isEmpty) {
            return Center(
              child: Text('no movies'),
            );
          }
          return Column(
            children: <Widget>[
              TextTitle(
                text: 'Trending movies',
                padding: EdgeInsets.all(8),
              ),
              Expanded(
                  child: MovieGrid(
                movies: state.movies,
              ))
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
