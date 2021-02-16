import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapi/models/articles.dart';
import 'package:newsapi/models/news.dart';
import 'package:http/http.dart' as http;


class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<News>(
          future: getNews(),
          builder: (context, snapshot){
            if(snapshot.hasData) {
              final news = snapshot.data;
              return topNewsWidget(context, news);
            }else if (snapshot.hasError){
              print(snapshot.error.toString());
              return Center(child: Text(snapshot.error.toString()));
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }


  Future<News> getNews() async {
    String url = 'http://newsapi.org/v2/everything?q=tesla&from=2021-01-16&sortBy=publishedAt&apiKey=6991fb343619449199304654ffa7a2a6';

    final response = await http.get(url);

    if(response.statusCode == 200) {
      final jsonNews = jsonDecode(response.body);
      return News.fromJson(jsonNews);
    } else {
      throw Exception();
    }
  }

  Widget newsWidget(BuildContext context, News news) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Status: ${news.status}'
        ),
        Text(
          'Status: ${news.totalResults}'
        ),

      ],
    );
  }

  Widget topNewsWidget(BuildContext context, News news) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: news.articleList.length,
        itemBuilder: (context, index){
          return Card(
            child: Text(news.articleList[index].title),
          );
        },
      ),
    );
  }
}
