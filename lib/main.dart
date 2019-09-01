import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/simple_bloc_delegate.dart';
import 'bloc/trending/bloc.dart';
import 'data/rest_client.dart';
import 'widget/home/home_page.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<TrendingBloc>(
      builder: (BuildContext context) =>
          TrendingBloc(restClient: RestClient())..dispatch(Fetch()),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Movie',
      home: HomePage(),
    );
  }
}
