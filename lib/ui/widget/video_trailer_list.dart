import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/component/navigator.dart';
import 'package:project_movie_flutter/domain/usecase/movie/get_video_trailer.dart';
import 'package:project_movie_flutter/ui/bloc/movie_video/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/video_trailer_item.dart';
import 'package:project_movie_flutter/util/exception_handler.dart';

import 'common/loading_indicator.dart';
import 'common/message_view.dart';

class VideoTrailerList extends StatelessWidget {
  final int _movieId;
  final MovieVideosBloc movieVideosBloc;

  VideoTrailerList(this._movieId, {this.movieVideosBloc});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final heightPct =
        mediaQueryData.orientation == Orientation.portrait ? 0.24 : 0.45;
    final bloc = movieVideosBloc ??
        MovieVideosBloc(
            getMovieVideos: RepositoryProvider.of<GetVideoTrailer>(context))
      ..add(Fetch(movieId: _movieId));
    return Container(
      height: mediaQueryData.size.height * heightPct,
      child: BlocBuilder<MovieVideosBloc, MovieVideosState>(
          bloc: bloc,
          builder: (bCtx, state) {
            if (state is Loading) {
              return LoadingIndicator();
            }
            if (state is Error) {
              return MessageView(
                message: '${ExceptionHandler.handle(context, state.exception)}',
              );
            }
            if (state is Result) {
              if (state.videos.isEmpty) {
                return MessageView(
                  icon: Icons.info_outline,
                  message:
                      AppLocalizations.of(context).translate('msg_no_video'),
                );
              }
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.videos.length,
                  itemBuilder: (bCtx, index) {
                    final video = state.videos.elementAt(index);
                    return VideoTrailerItem(
                      video,
                      onTap: () => AppNavigator.instance
                          .showBottomSheetMovieVideoTrailer(context, video),
                    );
                  });
            }
            return MessageView();
          }),
    );
  }
}
