class Articles {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String imageUrl;

  Articles({this.sourceName, this.author, this.title, this.description, this.imageUrl});

  factory Articles.fromjson(final json) {
    return Articles(
      sourceName: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['urlToImage'],
    );
  }
}