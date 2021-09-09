import 'package:dio/dio.dart' hide Headers;
import 'package:product_hunt_app/models/comment.dart';
import 'package:product_hunt_app/models/post.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

/// rest client for Product Hunt's API.
@RestApi(baseUrl: 'https://api.producthunt.com/v1/')
abstract class ApiClient {
  /// constructs rest client for Product Hunt's API.
  factory ApiClient(
    Dio dio,
  ) = _ApiClient;

  static const _headers = <String, dynamic>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Host': 'api.producthunt.com',
  };

  /// fetches today's posts
  @GET('/posts')
  @Headers(_headers)
  Future<Posts> getTodayPosts(
    @Header('Authorization') String authorization,
  );

  /// fetches specific day's posts
  @GET('/posts')
  @Headers(_headers)
  Future<Posts> getSpecificDayPosts(
    @Header('Authorization') String authorization,
    @Queries() Map<String, dynamic> queries,
  );

  /// fetches comments on a post
  @GET('/comments')
  @Headers(_headers)
  Future<Comments> getComments(
    @Header('Authorization') String authorization,
    @Queries() Map<String, dynamic> queries,
  );
}
