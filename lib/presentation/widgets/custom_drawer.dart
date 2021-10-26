import 'package:breaking_news/constants/colors_app.dart';
import 'package:breaking_news/cubit/theme_cubit.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      "https://static.vecteezy.com/system/resources/previews/000/198/210/original/breaking-news-background-with-earth-planet-vector.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Breaking News",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.appColor,
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
            ThemeCubit theme = BlocProvider.of<ThemeCubit>(context);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 20),
                  ),
                  DayNightSwitcher(
                    isDarkModeEnabled: theme.isDarkOn,
                    onStateChanged: (bool isDarkModeEnabled) {
                      theme.changeTheme();
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
