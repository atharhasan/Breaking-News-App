import 'package:breaking_news/constants/colors_app.dart';
import 'package:breaking_news/constants/strings.dart';
import 'package:breaking_news/cubit/news_cubit.dart';
import 'package:breaking_news/data/models/articles.dart';
import 'package:breaking_news/data/models/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  late News news;
  late List<Articles> allNews;
  late List<Articles> searchedNews;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  Widget buildSearchField() {
   return TextField(
          controller: searchTextController,
          decoration: const InputDecoration(
            hintText: "Search News",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white, fontSize: 15),
          onChanged: (searchedCharacter) {
            addSearchedNewsToSearchedList(searchedCharacter);
          },
        );
  }

  void addSearchedNewsToSearchedList(String searchedCharacter) {
    searchedNews = news.articles.where((articles) =>
            articles.newsTitle.toLowerCase().startsWith(searchedCharacter)).toList();
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
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearch,
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ))
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
        LocalHistoryEntry(onRemove: stopSearching));
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
    return const Text(
      "Breaking News",
      style: TextStyle(color: Colors.white, fontSize: 25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isSearching ? buildSearchField() :buildAppBar(),
      centerTitle: true,
      backgroundColor: AppColors.appColor,
      actions: buildAppBarIcons(),
    );
  }
}
