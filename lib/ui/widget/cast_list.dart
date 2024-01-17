import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_movie_flutter/domain/entity/cast.dart';
import 'package:project_movie_flutter/domain/usecase/movie/get_movie_credits.dart';
import 'package:project_movie_flutter/ui/bloc/movie_credit/bloc.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/util/exception_handler.dart';

import 'cast_list_item.dart';
import 'common/loading_indicator.dart';
import 'common/message_view.dart';

class CastList extends StatelessWidget {
  final int _movieId;
  final MovieCreditsBloc movieCreditsBloc;

  CastList(this._movieId, {this.movieCreditsBloc});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final bool portrait = mediaQueryData.orientation == Orientation.portrait;
    final bloc = this.movieCreditsBloc ??
        MovieCreditsBloc(
            getMovieCredits: RepositoryProvider.of<GetMovieCredits>(context))
      ..add(Fetch(movieId: _movieId));
    return LayoutBuilder(
      builder: (ctx, constraints) {
        double width = constraints.maxWidth;
        double height = mediaQueryData.size.height;
        return BlocBuilder<MovieCreditsBloc, MovieCreditsState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is Loading) {
              return LoadingIndicator();
            }
            if (state is Loaded) {
              if (state.casts.isEmpty) {
                return MessageView(
                    message:
                        AppLocalizations.of(context).translate('msg_no_casts'));
              }
              return _buildContent(width, height, portrait, state.casts);
            }
            if (state is Error) {
              return MessageView(
                  message: ExceptionHandler.handle(context, state.exception));
            }
            return Container();
          },
        );
      },
    );
  }

  _buildContent(double width, double height, bool portrait, List<Cast> casts) {
    return Container(
        width: double.infinity,
        height: portrait ? height * 0.2 : height * 0.4,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: casts.length,
            itemBuilder: (context, index) {
              var cast = casts.elementAt(index);
              return Container(
                width: portrait ? width * 0.25 : width * 0.2,
                margin: EdgeInsets.only(left: 8, right: 8),
                child:
                    CastListItem(title: cast.name, imageUrl: cast.profilePath),
              );
            }));
  }
}
