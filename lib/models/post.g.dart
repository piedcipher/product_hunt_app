// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posts _$PostsFromJson(Map<String, dynamic> json) {
  return Posts(
    posts: (json['posts'] as List<dynamic>)
        .map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PostsToJson(Posts instance) => <String, dynamic>{
      'posts': instance.posts,
    };

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    id: json['id'] as int,
    name: json['name'] as String,
    tagline: json['tagline'] as String,
    votesCount: json['votes_count'] as int,
    commentsCount: json['comments_count'] as int,
    day: json['day'] as String,
    discussionUrl: json['discussion_url'] as String,
    thumbnail: Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'votes_count': instance.votesCount,
      'comments_count': instance.commentsCount,
      'day': instance.day,
      'discussion_url': instance.discussionUrl,
      'thumbnail': instance.thumbnail,
    };
