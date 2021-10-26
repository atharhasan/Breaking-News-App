import 'package:breaking_news/constants/colors_app.dart';
import 'package:breaking_news/constants/strings.dart';
import 'package:breaking_news/data/models/articles.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final Articles articles;
  const NewsItem({Key? key, required this.articles}) : super(key: key);

  Widget customSizedBox(double height, double width) {
    return SizedBox(height: height, width: width);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.grey,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
                color: Theme.of(context).appBarTheme.backgroundColor ==
                        AppColors.appColor
                    ? Colors.amber
                    : AppColors.appColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    articles.imageNewsUrl != null
                        ? articles.imageNewsUrl
                        : "https://static.vecteezy.com/system/resources/previews/000/198/210/original/breaking-news-background-with-earth-planet-vector.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
                customSizedBox(0, 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articles.newsTitle,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      customSizedBox(5, 0),
                      // ignore: prefer_if_null_operators
                      Text(
                        articles.description != null
                            ? articles.description
                            : "لا يوجد تفاصيل",
                        style: Theme.of(context).textTheme.bodyText2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, detailsScreen,
                                arguments: articles);
                          },
                          child: const Text("Read more>>>")),
                    ],
                  ),
                ),
              ],
            ),
            customSizedBox(5, 0),
            Text(
              articles.publishDate.toString(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
