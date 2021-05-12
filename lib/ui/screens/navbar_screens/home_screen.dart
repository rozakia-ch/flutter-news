import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/cubit/hot_news_cubit.dart';
import 'package:flutter_news/logic/cubit/sources_cubit.dart';
import 'package:flutter_news/logic/cubit/topheadlines_cubit.dart';
import 'package:flutter_news/ui/widgets/hotnews.dart';
import 'package:flutter_news/ui/widgets/topchannels.dart';
import 'package:flutter_news/ui/widgets/topheadlines.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TopheadlinesCubit()..getHeadlines()),
        BlocProvider(create: (context) => SourcesCubit()..getSources()),
        BlocProvider(create: (context) => HotNewsCubit()..getHotNews()),
      ],
      child: Container(
        child: ListView(
          children: [
            Topheadlines(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Top channels",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            Topchannels(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Hot news",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            Hotnews(),
          ],
        ),
      ),
    );
  }
}
