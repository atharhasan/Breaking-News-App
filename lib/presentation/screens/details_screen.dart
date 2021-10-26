import 'package:breaking_news/constants/app_themes.dart';
import 'package:breaking_news/cubit/theme_cubit.dart';
import 'package:breaking_news/data/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.articles}) : super(key: key);
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeCubit theme = BlocProvider.of<ThemeCubit>(context);
        return Scaffold(
          backgroundColor: theme.isDarkOn
              ? AppThemes.lightTheme.backgroundColor
              : AppThemes.darkTheme.backgroundColor,
          appBar: AppBar(
            title: Text(
              articles.newsTitle,
              style: AppBarTheme.of(context).titleTextStyle,
            ),
            backgroundColor: theme.isDarkOn
                ? AppThemes.lightTheme.appBarTheme.backgroundColor
                : AppThemes.darkTheme.appBarTheme.backgroundColor,
          ),
          body: WebView(
            initialUrl: articles.newsUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        );
      },
    );
  }
}
