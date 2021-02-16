import 'package:newsapi/models/articles.dart';

class News {
  final String status;
  final int totalResults;
  List<Articles> articleList;

  News({this.status, this.totalResults, this.articleList});

  factory News.fromJson(Map<String, dynamic> json){
    return News(
      status: json['status'],
      totalResults: json['totalResults'],
      articleList: json['articles'] != null ? json['articles'].map<Articles>((x) => Articles
          .fromjson(x)).toList()
          : null
    );
  }
}