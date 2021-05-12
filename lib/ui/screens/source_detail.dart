import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/cubit/source_news_cubit.dart';
import 'package:flutter_news/logic/models/article.dart';
import 'package:flutter_news/logic/models/article_response.dart';
import 'package:flutter_news/logic/models/source.dart';
import 'package:flutter_news/ui/screens/news_detail.dart';
import 'package:flutter_news/ui/styles/style.dart' as Style;
import 'package:timeago/timeago.dart' as timeago;

class SourceDetail extends StatelessWidget {
  const SourceDetail({Key? key, this.source}) : super(key: key);
  final Source? source;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: false,
          elevation: 0.0,
          backgroundColor: Style.Colors.mainColor,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            color: Style.Colors.mainColor,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Hero(
                  tag: source!.id!,
                  child: SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/logos/${source!.id}.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  source!.name!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  source!.description!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => SourceNewsCubit()..getSourceNews(sourceId: source!.id),
              child: BlocBuilder<SourceNewsCubit, SourceNewsState>(
                builder: (context, state) {
                  if (state is SourceNewsLoading) {
                    return Container();
                  } else if (state is SourceNewsLoaded) {
                    return _buildSourceNewsWidget(context, state.articles!);
                  }
                  return Container();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSourceNewsWidget(BuildContext context, ArticleResponse data) {
    List<Article> articles = data.articles!;

    if (articles.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "No more news",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetail(
                    article: articles[index],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!, width: 1.0),
                ),
                color: Colors.white,
              ),
              height: 150,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                    width: MediaQuery.of(context).size.width * 3 / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          articles[index].title!,
                          maxLines: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14.0),
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    timeUntil(DateTime.parse(articles[index].publishedAt!)),
                                    style: TextStyle(
                                      color: Colors.black26,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    width: MediaQuery.of(context).size.width * 2 / 5,
                    height: 130,
                    child: FadeInImage.assetNetwork(
                      alignment: Alignment.topCenter,
                      placeholder: 'assets/images/placeholder.jpg',
                      image: articles[index].urlToImage == null
                          ? "https://complianz.io/wp-content/uploads/2019/03/placeholder-300x202.jpg"
                          : articles[index].urlToImage!,
                      fit: BoxFit.fitHeight,
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height * 1 / 3,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
