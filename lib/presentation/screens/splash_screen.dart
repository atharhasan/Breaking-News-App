import 'package:breaking_news/cubit/news_cubit.dart';
import 'package:breaking_news/data/repository/articales_repository.dart';
import 'package:breaking_news/data/web_services/articles_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: BlocProvider(create: (BuildContext context) =>
          NewsCubit(ArticlesRepository(ArticlesWebServices())),child: HomeScreen(),),
      duration: 4000,
      imageSize: 600,
      imageSrc: "assets/images/splash_screen.png",
      text: "Breaking News ",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 25.0, fontWeight: FontWeight.bold),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}
