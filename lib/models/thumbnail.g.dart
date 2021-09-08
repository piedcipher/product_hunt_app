// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) {
  return Thumbnail(
    id: json['id'] as int,
    mediaType: json['media_type'] as String,
    imageUrl: json['image_url'] as String,
  );
}

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'media_type': instance.mediaType,
    };
