import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_news/logic/models/article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_news/ui/styles/style.dart' as Style;

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key, this.article}) : super(key: key);
  final Article? article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          launch(article!.url!);
        },
        child: Container(
          height: 48.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white, gradient: Style.Colors.primaryGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Read More",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFPro-Bold",
                    fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Style.Colors.mainColor,
        title: Text(
          article!.title!,
          style: TextStyle(
              fontSize: Theme.of(context).platform == TargetPlatform.iOS
                  ? 17.0
                  : 17.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: FadeInImage.assetNetwork(
                alignment: Alignment.topCenter,
                placeholder: 'images/placeholder.png',
                image: article!.urlToImage == null
                    ? "https://complianz.io/wp-content/uploads/2019/03/placeholder-300x202.jpg"
                    : article!.urlToImage!,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 1 / 3),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(article!.publishedAt!.substring(0, 10),
                        style: TextStyle(
                            color: Style.Colors.mainColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(article!.title!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  timeUntil(DateTime.parse(article!.publishedAt!)),
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                if (article!.content != null)
                  Html(
                    data: article!.content,

                    // renderNewlines: true,
                    // defaultTextStyle: TextStyle(fontSize: 14.0, color: Colors.black87),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true);
  }
}
