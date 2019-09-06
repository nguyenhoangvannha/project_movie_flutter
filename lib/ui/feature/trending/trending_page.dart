import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/ui/widget/common/loading_indicator.dart';
import 'package:project_movie/ui/widget/common/search_list_item.dart';

import '../../../bloc/trending/bloc.dart';
import '../../../ui/feature/search/movie_search_delegate.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  TrendingBloc _trendingBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _trendingBloc = BlocProvider.of<TrendingBloc>(context);
    _trendingBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MovieSearchDelegate());
            },
          )
        ],
      ),
      body: BlocBuilder<TrendingBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is MovieLoaded) {
            if (state.movies.isEmpty) {
              return Center(
                child: Text('no movies'),
              );
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.movies.length
                    ? LoadingIndicator()
                    : SearchListItem(movie: state.movies[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.movies.length
                  : state.movies.length + 1,
              controller: _scrollController,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _trendingBloc.dispatch(Fetch());
    }
  }
}
