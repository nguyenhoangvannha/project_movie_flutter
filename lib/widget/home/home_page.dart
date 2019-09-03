import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie/bloc/trending/bloc.dart';
import 'package:project_movie/widget/common/bottom_loader.dart';
import 'package:project_movie/widget/common/search_movie_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  TrendingBloc _trendingBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _trendingBloc = BlocProvider.of<TrendingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _trendingBloc.dispatch(Fetch());
    return Scaffold(
      appBar: AppBar(title: Text('Movies'),),
      body: BlocBuilder<TrendingBloc, TrendingState>(
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
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.movies.length
                    ? BottomLoader()
                    : SearchSuggestionItem(movie: state.movies[index]);
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
