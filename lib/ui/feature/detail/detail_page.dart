import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_movie_flutter/domain/entity/movie.dart';
import 'package:project_movie_flutter/domain/usecase/movie/export.dart';
import 'package:project_movie_flutter/ui/bloc/movie_credit/bloc.dart';
import 'package:project_movie_flutter/ui/bloc/movie_detail/bloc.dart' as detail;
import 'package:project_movie_flutter/ui/bloc/movie_video/bloc.dart' as video;
import 'package:project_movie_flutter/ui/bloc/recommendation_movie/bloc.dart'
    as recommendation;
import 'package:project_movie_flutter/ui/bloc/similar_movie/bloc.dart'
    as similar;
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/cast_list.dart';
import 'package:project_movie_flutter/ui/widget/common/cached_image.dart';
import 'package:project_movie_flutter/ui/widget/common/container.dart';
import 'package:project_movie_flutter/ui/widget/common/loading_indicator.dart';
import 'package:project_movie_flutter/ui/widget/common/message_view.dart';
import 'package:project_movie_flutter/ui/widget/common/text.dart';
import 'package:project_movie_flutter/ui/widget/recommendations_movies_list.dart';
import 'package:project_movie_flutter/ui/widget/similar_movies_list.dart';
import 'package:project_movie_flutter/ui/widget/star_button.dart';
import 'package:project_movie_flutter/ui/widget/video_trailer_list.dart';
import 'package:project_movie_flutter/util/date_time_format.dart';
import 'package:project_movie_flutter/util/exception_handler.dart';

class DetailPage extends StatefulWidget {
  DetailPage();

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _movieId;
  detail.MovieDetailsBloc? _movieDetailsBloc;
  var _movieCreditsBloc;
  var _similarMovieBloc;
  var _recommendationMovieBloc;
  var _movieVideosBloc;
  bool _alreadyInitRelativeBlocs = false;

  @override
  void didChangeDependencies() {
    _initMovieDetailsBloc();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    return BlocBuilder<detail.MovieDetailsBloc, detail.MovieDetailsState>(
      bloc: _movieDetailsBloc,
      builder: (bCtx, state) {
        if (state is detail.Loading) {
          return Scaffold(
            body: LoadingIndicator(),
          );
        }
        if (state is detail.Error) {
          return _buildError(context, state.exception, translator!);
        }
        if (state is detail.Result) {
          if (!_alreadyInitRelativeBlocs) {
            _initRelativeBlocs();
            _alreadyInitRelativeBlocs = true;
          }
          return Scaffold(
            body: _buildResult(context, state.movie!, translator!),
          );
        }
        return MessageView();
      },
    );
  }

  Widget _buildError(
      BuildContext context, Object? exception, AppLocalizations translator) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MessageView(
              message: '${ExceptionHandler.handle(context, exception)}',
            ),
            ElevatedButton(
                onPressed: () {
                  _movieDetailsBloc!.add(detail.Fetch(movieId: _movieId));
                },
                child: Text(translator.translate('act_retry')!)),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(translator.translate('act_back')!)),
          ],
        ),
      ),
    );
  }

  Widget _buildResult(
      BuildContext context, Movie movie, AppLocalizations translator) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildAppBar(MediaQuery.of(context), movie),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildOverView(translator, movie),
                TextTitle(translator.translate('title_video_trailer')),
                SizedBox(height: 16),
                VideoTrailerList(
                  movie.id,
                  movieVideosBloc: _movieVideosBloc,
                ),
                SizedBox(height: 16),
                TextTitle(translator.translate('title_casts')),
                CastList(
                  movie.id,
                  movieCreditsBloc: _movieCreditsBloc,
                ),
                SizedBox(height: 16),
                TextTitle(translator.translate('title_similar_movie')),
                SizedBox(height: 8),
                SimilarMoviesList(
                  movie.id,
                  similarMovieBloc: _similarMovieBloc,
                ),
                SizedBox(height: 16),
                TextTitle(translator.translate('title_recommendation_movie')),
                SizedBox(height: 8),
                RecommendationsMoviesList(
                  movie.id,
                  recommendationMovieBloc: _recommendationMovieBloc,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildOverView(AppLocalizations translator, Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextTitle(
          movie.title,
          fontSize: 28,
          maxLines: 2,
        ),
        SizedBox(height: 16),
        Center(
          child: RatingBarIndicator(
            rating: movie.voteAverage!,
            itemCount: 10,
            itemSize: 25.0,
            unratedColor: Colors.amber.withAlpha(50),
            itemPadding: EdgeInsets.all(2),
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildCustomListTile(
                Icons.access_time,
                DateTimeFormat.format(movie.runTime!.toInt()),
                translator.translate('title_duration')!),
            _buildCustomListTile(Icons.date_range, movie.releaseDate!,
                translator.translate('title_release')!),
          ],
        ),
        SizedBox(height: 8),
        TextTitle(translator.translate('title_overview')),
        SizedBox(height: 8),
        ExpandableText(movie.overview),
      ],
    );
  }

  _buildAppBar(MediaQueryData mediaQuery, Movie movie) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: mediaQuery.orientation == Orientation.portrait
              ? mediaQuery.size.height * 0.4
              : mediaQuery.size.height * 0.6,
          margin: EdgeInsets.only(bottom: 8),
          child: CustomCard(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
            child: CachedImage(
              image: movie.posterPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: mediaQuery.padding.top,
          width: mediaQuery.size.width,
          child: ListTile(
            leading: CustomCard(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: BackButton(),
            ),
            trailing: CustomCard(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: StarButton(
                  movie: movie,
                )),
          ),
        )
      ],
    );
  }

  _buildCustomListTile(IconData icon, String title, String subtitle) {
    return Container(
      width: 140,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Icon(
          icon,
          size: 32,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }

  void _initMovieDetailsBloc() {
    if (_movieId == null) {
      _movieId = ModalRoute.of(context)!.settings.arguments;
    }
    if (_movieDetailsBloc == null) {
      _movieDetailsBloc = detail.MovieDetailsBloc(
          getMovieDetails: RepositoryProvider.of<GetMovieDetail>(context))
        ..add(detail.Fetch(movieId: _movieId));
    }
  }

  void _initRelativeBlocs() {
    if (_movieCreditsBloc == null) {
      _movieCreditsBloc = MovieCreditsBloc(
          getMovieCredits: RepositoryProvider.of<GetMovieCredits>(context))
        ..add(Fetch(movieId: _movieId));
    }
    if (_similarMovieBloc == null) {
      _similarMovieBloc = similar.SimilarMovieBloc(
          getSimilarMovies: RepositoryProvider.of<GetSimilarMovies>(context))
        ..add(similar.Fetch(movieId: _movieId));
    }
    if (_recommendationMovieBloc == null) {
      _recommendationMovieBloc = recommendation.RecommendationMovieBloc(
          getRecommendationMovie:
              RepositoryProvider.of<GetRecommendationsMovies>(context))
        ..add(recommendation.Fetch(movieId: _movieId));
    }
    if (_movieVideosBloc == null) {
      _movieVideosBloc = video.MovieVideosBloc(
          getMovieVideos: RepositoryProvider.of<GetVideoTrailer>(context))
        ..add(video.Fetch(movieId: _movieId));
    }
  }
}
