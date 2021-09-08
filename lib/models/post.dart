import 'package:json_annotation/json_annotation.dart';
import 'package:product_hunt_app/models/thumbnail.dart';

part 'post.g.dart';

/// list of product hunt post object.
@JsonSerializable()
class Posts {
  /// constructs list of product hunt post object.
  Posts({
    required this.posts,
  });

  /// constructs posts object from json.
  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);

  /// constructs json from posts object.
  Map<String, dynamic> toJson() => _$PostsToJson(this);

  /// list of posts
  final List<Post> posts;
}

/// product hunt post object.
@JsonSerializable()
class Post {
  /// constructs product hunt post object.
  Post({
    required this.id,
    required this.name,
    required this.tagline,
    required this.votesCount,
    required this.commentsCount,
    required this.day,
    required this.discussionUrl,
    required this.thumbnail,
  });

  /// constructs post object from json.
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// constructs json from post object.
  Map<String, dynamic> toJson() => _$PostToJson(this);

  /// post id.
  final int id;

  /// post name.
  final String name;

  /// post tagline.
  final String tagline;

  /// number of votes on the post.
  @JsonKey(name: 'votes_count')
  final int votesCount;

  /// number of comments on the post.
  @JsonKey(name: 'comments_count')
  final int commentsCount;

  /// date-time of the post.
  final String day;

  /// link to discussion page.
  @JsonKey(name: 'discussion_url')
  final String discussionUrl;

  /// thumbnail of the post.
  final Thumbnail thumbnail;
}
