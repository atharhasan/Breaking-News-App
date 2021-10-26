class Articles {
  late Source source;
  late dynamic author;
  late String newsTitle;
  late dynamic description;
  late String newsUrl;
  late dynamic imageNewsUrl;
  late String publishDate;
  late dynamic content;

  Articles.fromJson(Map<String, dynamic> json) {
    source = (json['source'] != null? Source.fromJson(json['source']):null)!;
    author = json['author'];
    newsTitle = json['title'];
    description = json['description'];
    newsUrl = json['url'];
    imageNewsUrl = json['urlToImage'];
    publishDate = json['publishedAt'];
    content = json['content'];
  }
}


class Source {
  late dynamic id;
  late dynamic name;

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}