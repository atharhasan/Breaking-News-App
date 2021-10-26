import 'package:breaking_news/constants/colors_app.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
      required this.text,
      required this.selectedIndex,
      required this.index})
      : super(key: key);
  final String text;
  final int selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.appColor
              ? (selectedIndex == index ? Colors.amber : Colors.black)
              : selectedIndex == index
                  ? AppColors.appColor
                  : Colors.white,
          // selectedIndex == index ? AppColors.appColor : Colors.white,
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
              color: Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.appColor
                  ? Colors.amber
                  : AppColors.appColor),
        ),
        child: Text(
          text.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,

          // selectedIndex == index ? Colors.white : Colors.black,
        ));
  }
}
