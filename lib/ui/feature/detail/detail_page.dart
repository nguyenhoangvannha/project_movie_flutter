import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/bloc/movie_detail/bloc.dart';
import 'package:project_movie/bloc/similar/bloc.dart';
import 'package:project_movie/data/respository/entity/movie.dart';
import 'package:project_movie/ui/widget/common/cast_list.dart';
import 'package:project_movie/ui/widget/common/error_view.dart';
import 'package:project_movie/ui/widget/common/loading_indicator.dart';
import 'package:project_movie/ui/widget/common/movie_details_overview.dart';
import 'package:project_movie/ui/widget/common/movie_list.dart';

class DetailPage extends StatelessWidget {
  final int movieId;

  DetailPage({@required this.movieId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieDetailBloc>(context).dispatch(Load(movieId: movieId));
    BlocProvider.of<SimilarBloc>(context).dispatch(Fetch(movieId: movieId));
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (bCtx, state) {
          if (state is Loading) {
            return LoadingIndicator();
          }
          if (state is Error) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          if (state is NotFound) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          if (state is Result) {
            return _buildContent(state.movie);
          }
          return ErrorView();
        },
      ),
    );
  }

  Widget _buildContent(Movie movie) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MovieDetailsOverview(movie),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                CastList('123', 34),
                _buildSimilarMovies(),
                _buildRecommendationsMovies(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildSimilarMovies() {
    return Column(children: <Widget>[
      ListTile(title: Text('Similar movies'),),
      BlocBuilder<SimilarBloc, MovieState>(
        builder: (bCtx, state) {
          if (state is MovieLoading) {
            return LoadingIndicator();
          }
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
            return MoviesListWithTitleHorizontal(
              movies: state.movies,
            );
          }
          return Center(
            child: ErrorView(),
          );
        },
      )
    ],);
  }

  _buildRecommendationsMovies() {
    return Column(children: <Widget>[
      ListTile(title: Text('Similar movies'),),
      BlocBuilder<SimilarBloc, MovieState>(
        builder: (bCtx, state) {
          if (state is MovieLoading) {
            return LoadingIndicator();
          }
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
            return MoviesListWithTitleHorizontal(
              movies: state.movies,
            );
          }
          return Center(
            child: ErrorView(),
          );
        },
      )
    ],);
  }
}
