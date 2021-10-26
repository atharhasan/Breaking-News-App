import 'package:breaking_news/constants/app_themes.dart';
import 'package:breaking_news/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_route.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: BreakingNews(
      appRouter: AppRouter(),
    ),
  ));
}

class BreakingNews extends StatelessWidget {
  final AppRouter appRouter;
  const BreakingNews({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeCubit theme = BlocProvider.of<ThemeCubit>(context);
        return MaterialApp(
          title: 'Breaking News',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: theme.isDarkOn ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
