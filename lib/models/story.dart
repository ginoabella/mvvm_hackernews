class Story {
  final String title;
  final String url;
  List commentIds = [];

  Story({
    this.title,
    this.url,
    this.commentIds,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      title: json['title'] as String,
      url: json['url'] as String,
      commentIds: (json["kids"] ?? []) as List,
    );
  }
}
