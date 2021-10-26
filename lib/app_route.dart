import 'package:breaking_news/data/models/articles.dart';
import 'package:breaking_news/presentation/screens/details_screen.dart';
import 'package:breaking_news/presentation/screens/home_screen.dart';
import 'package:breaking_news/presentation/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
import 'cubit/news_cubit.dart';
import 'data/repository/articales_repository.dart';
import 'data/web_services/articles_web_services.dart';

class AppRouter {
  late ArticlesRepository articlesRepository;
  late NewsCubit newsCubit;
  AppRouter() {
    articlesRepository = ArticlesRepository(ArticlesWebServices());
    newsCubit = NewsCubit(articlesRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
                  create: (BuildContext context) => newsCubit,
                  child: const HomeScreen(),
                ));

      case detailsScreen:
        final articles = settings.arguments as Articles;
        return MaterialPageRoute(
            builder: (BuildContext context) => DetailsScreen(
                  articles: articles,
                ));
    }
  }
}
