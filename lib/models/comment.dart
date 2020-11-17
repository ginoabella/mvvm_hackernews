class Comment {
  final String title;
  final int commentId;

  Comment({this.title, this.commentId});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      title: json['text'] as String,
      commentId: json['id'] as int,
    );
  }
}
