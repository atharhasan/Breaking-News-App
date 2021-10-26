import 'package:breaking_news/constants/strings.dart';
import 'package:breaking_news/data/models/news.dart';
import 'package:dio/dio.dart';

class ArticlesWebServices {
  late Dio dio;
  ArticlesWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      queryParameters: {
        'category': category,
        'apiKey': apiKey,
        'country': 'eg'
      },
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<News> getArticles() async {
    try {
      Response response = await dio.get(path, queryParameters: {
        'category': category,
        'apiKey': apiKey,
        'country': 'eg'
      });
      print(response.data);
      return News.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
