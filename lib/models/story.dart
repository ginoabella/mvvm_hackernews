class Story {
  final String title;
  final String url;

  Story({this.title, this.url});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }
}
