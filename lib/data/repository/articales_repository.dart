import 'package:breaking_news/data/models/news.dart';
import 'package:breaking_news/data/web_services/articles_web_services.dart';

class ArticlesRepository {
  final ArticlesWebServices articlesWebServices;

  ArticlesRepository(this.articlesWebServices);

  Future<News> getArticles() {
    return articlesWebServices.getArticles();

    // return article.map<Articles>((value) => Articles.fromJson(value)).toList();
  }
}
