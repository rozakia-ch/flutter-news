import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/cubit/topheadlines_cubit.dart';
import 'package:flutter_news/logic/models/article.dart';
import 'package:flutter_news/logic/models/article_response.dart';
import 'package:flutter_news/ui/screens/news_detail.dart';
import 'package:timeago/timeago.dart' as timeago;

class Topheadlines extends StatelessWidget {
  const Topheadlines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopheadlinesCubit, TopheadlinesState>(
      builder: (context, state) {
        if (state is TopheadlinesLoading) {
          return Container();
        } else if (state is TopheadlinesLoaded) {
          return _buildHeadline(context, state.articles!);
        }
        return Container();
      },
    );
  }

  Widget _buildHeadline(BuildContext context, ArticleResponse data) {
    List<Article> articles = data.articles!;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: false,
          height: 200.0,
          viewportFraction: 0.9,
        ),
        items: getExpenseSliders(context, articles),
      ),
    );
  }

  getExpenseSliders(BuildContext context, List<Article> articles) {
    return articles
        .map(
          (article) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetail(
                    article: article,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
              child: Stack(
                children: [
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: (article.urlToImage == null
                            ? AssetImage("assets/images/placeholder.jpg")
                            : NetworkImage(article.urlToImage!)) as ImageProvider<Object>,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [0.1, 0.9],
                        colors: [Colors.black.withOpacity(0.9), Colors.white.withOpacity(0.0)],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      width: 250.0,
                      child: Column(
                        children: <Widget>[
                          Text(
                            article.title!,
                            style: TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 10.0,
                    child: Text(
                      article.source!.name!,
                      style: TextStyle(color: Colors.white54, fontSize: 9.0),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: Text(
                      timeUntil(
                        DateTime.parse(article.publishedAt!),
                      ),
                      style: TextStyle(color: Colors.white54, fontSize: 9.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
