import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

/// list of comments on a post object.
@JsonSerializable()
class Comments {
  /// constructs list of comments on a post object.
  Comments({
    required this.comments,
  });

  /// constructs comments object from json.
  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  /// constructs json from comments object.
  Map<String, dynamic> toJson() => _$CommentsToJson(this);

  /// list of comments
  final List<Comment> comments;
}

/// product hunt comment object.
@JsonSerializable()
class Comment {
  /// constructs product hunt comment object.
  Comment({
    required this.id,
    required this.body,
  });

  /// constructs comment object from json.
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  /// constructs json from comment object.
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  /// comment id.
  final int id;

  /// comment text.
  final String body;
}
