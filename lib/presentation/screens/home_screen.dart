import 'package:breaking_news/constants/app_themes.dart';
import 'package:breaking_news/constants/colors_app.dart';
import 'package:breaking_news/cubit/news_cubit.dart';
import 'package:breaking_news/cubit/theme_cubit.dart';
import 'package:breaking_news/data/models/articles.dart';
import 'package:breaking_news/data/models/news.dart';
import 'package:breaking_news/presentation/widgets/custom_drawer.dart';
import 'package:breaking_news/presentation/widgets/news_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late News allNews;
  late List<Articles> searchedNews;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsCubit>(context).getArticles();
  }

  Widget listBuildWidget() {
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      if (state is NewsLoadedList) {
        allNews = (state).news;
        return buildAllScreen();
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.appColor,
          ),
        );
      }
    });
  }

  Widget buildAllScreen() {
    return SingleChildScrollView(
      child: buildLoadedList(),
    );
  }

  Widget buildLoadedList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return NewsItem(
          articles: searchTextController.text.isEmpty
              ? allNews.articles[index]
              : searchedNews[index],
        );
      },
      itemCount: searchTextController.text.isEmpty
          ? allNews.articles.length
          : searchedNews.length,
    );
  }

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      decoration: InputDecoration(
        hintText: "Search News",
        hintStyle: Theme.of(context).appBarTheme.titleTextStyle,
        border: InputBorder.none,
      ),
      style: Theme.of(context).appBarTheme.titleTextStyle,
      onChanged: (searchedCharacter) {
        addSearchedNewsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedNewsToSearchedList(String searchedCharacter) {
    searchedNews = allNews.articles
        .where((articles) =>
            articles.newsTitle.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarIcons() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(Icons.clear, color: IconTheme.of(context).color))
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearch,
            icon: Icon(
              Icons.search,
              color: IconTheme.of(context).color,
            ))
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget buildAppBar() {
    return Text(
      "Breaking News",
      style: AppBarTheme.of(context).titleTextStyle,
      // TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        ThemeCubit theme = BlocProvider.of<ThemeCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: isSearching ? buildSearchField() : buildAppBar(),
            centerTitle: true,
            backgroundColor: theme.isDarkOn
                ? AppThemes.lightTheme.appBarTheme.backgroundColor
                : AppThemes.darkTheme.appBarTheme.backgroundColor,
            actions: buildAppBarIcons(),
            iconTheme: Theme.of(context).iconTheme,
          ),
          drawer: const CustomDrawer(),
          body: listBuildWidget(),
        );
      },
    );
  }
}
