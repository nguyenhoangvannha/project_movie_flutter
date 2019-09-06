import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/bloc/trending/bloc.dart';
import 'package:project_movie/ui/widget/common/movie_grid.dart';

import 'common/error_view.dart';

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
    return BlocBuilder<TrendingBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieError) {
          return Center(
            child: ErrorView(message: state.message),
          );
        }
        if (state is MovieLoaded) {
          if (state.movies.isEmpty) {
            return Center(
              child: Text('no movies'),
            );
          }
          return Column(
            children: <Widget>[
              Text(
                'Trending movies',
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
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
