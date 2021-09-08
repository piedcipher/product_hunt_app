import 'package:json_annotation/json_annotation.dart';

part 'thumbnail.g.dart';

/// product hunt thumbnail object in post object.
@JsonSerializable()
class Thumbnail {
  /// constructs product hunt thumbnail object in post object.
  Thumbnail({
    required this.id,
    required this.mediaType,
    required this.imageUrl,
  });

  /// constructs thumbnail object from json.
  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);

  /// constructs json from thumbnail object.
  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);

  /// thumbnail id.
  final int id;

  /// thumbnail url.
  @JsonKey(name: 'image_url')
  final String imageUrl;

  /// thumbnail type.
  @JsonKey(name: 'media_type')
  final String mediaType;
}
