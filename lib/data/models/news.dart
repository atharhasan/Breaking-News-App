import 'articles.dart';

class News {
  late String status;
  late int totalResults;
  late List<Articles> articles;


  News.fromJson(Map<String, dynamic> json) {
    print(json['articles'].length);
    status = json['status'];
    totalResults = json['totalResults'];
    articles = (json['articles'] as List).map((article) => Articles.fromJson(article)).toList();

    // json['articles'].forEach((v) {
    //   articles.add( Articles.fromJson(v));
    // });
  }
}