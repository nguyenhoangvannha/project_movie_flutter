import 'package:flutter/material.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/util/movie_sort_type.dart';

class BottomSheetSort extends StatefulWidget {
  final SortType currentSortType;
  final Function(SortType sortType) onSortTypeChanged;

  BottomSheetSort(
      {@required this.currentSortType, @required this.onSortTypeChanged});

  @override
  _BottomSheetSortState createState() => _BottomSheetSortState();
}

class _BottomSheetSortState extends State<BottomSheetSort> {
  var _currentSortType;
  AppLocalizations _translator;

  @override
  void initState() {
    super.initState();
    _currentSortType = widget.currentSortType;
  }

  @override
  Widget build(BuildContext context) {
    _translator = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.only(top: 16, left: 8, right: 8),
      child: Column(
        children: <Widget>[
          Text(
            _translator.translate('title_sort'),
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildSortItem(context, SortType.name_inc),
                _buildDivider(),
                _buildSortItem(context, SortType.name_dec),
                _buildDivider(),
                _buildSortItem(context, SortType.date_inc),
                _buildDivider(),
                _buildSortItem(context, SortType.date_dec),
                _buildDivider(),
                _buildSortItem(context, SortType.popular_inc),
                _buildDivider(),
                _buildSortItem(context, SortType.popular_dec),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 8,
      indent: 26,
      endIndent: 26,
    );
  }

  Widget _buildSortItem(BuildContext context, SortType itemSortType) {
    return RadioListTile(
      key: UniqueKey(),
      value: itemSortType,
      title: Text(
        _translator.translate(itemSortType.toString()),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      groupValue: _currentSortType,
      onChanged: (value) => _changeSortType(value),
      controlAffinity: ListTileControlAffinity.platform,
    );
  }

  void _changeSortType(SortType value) {
    setState(() {
      _currentSortType = value;
      widget.onSortTypeChanged(value);
    });
  }
}
