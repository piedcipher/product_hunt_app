// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.producthunt.com/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Posts> getTodayPosts(authorization) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Posts>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Accept': 'application/json',
                  r'Content-Type': 'application/json',
                  r'Host': 'api.producthunt.com',
                  r'Authorization': authorization
                },
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, '/posts',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Posts.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Posts> getSpecificDayPosts(authorization, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Posts>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Accept': 'application/json',
                  r'Content-Type': 'application/json',
                  r'Host': 'api.producthunt.com',
                  r'Authorization': authorization
                },
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, '/posts',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Posts.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Comments> getComments(authorization, queries) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Comments>(Options(
                method: 'GET',
                headers: <String, dynamic>{
                  r'Accept': 'application/json',
                  r'Content-Type': 'application/json',
                  r'Host': 'api.producthunt.com',
                  r'Authorization': authorization
                },
                extra: _extra,
                contentType: 'application/json')
            .compose(_dio.options, '/comments',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Comments.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
