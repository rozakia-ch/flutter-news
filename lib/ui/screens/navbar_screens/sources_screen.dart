import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/logic/cubit/sources_cubit.dart';
import 'package:flutter_news/logic/models/source.dart';
import 'package:flutter_news/logic/models/source_response.dart';
import 'package:flutter_news/ui/screens/source_detail.dart';

class SourcesScreen extends StatelessWidget {
  const SourcesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SourcesCubit()..getSources(),
      child: BlocBuilder<SourcesCubit, SourcesState>(
        builder: (context, state) {
          if (state is SourcesLoading) {
            return Container();
          } else if (state is SourcesLoaded) {
            return _buildSourcesWidget(context, state.sources);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSourcesWidget(BuildContext context, SourceResponse data) {
    List<Source> sources = data.sources;
    if (sources.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Sources",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return GridView.builder(
        itemCount: sources.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.86),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SourceDetail(
                            // source: sources[index],
                            )));
              },
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[100],
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        1.0,
                        1.0,
                      ),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: sources[index].id,
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/logos/${sources[index].id}.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        sources[index].name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
