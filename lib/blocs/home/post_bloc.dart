import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:product_hunt_app/blocs/home/post_event.dart';
import 'package:product_hunt_app/blocs/home/post_state.dart';
import 'package:product_hunt_app/core/constants/constants.dart';
import 'package:product_hunt_app/data/api/api_client.dart';
import 'package:product_hunt_app/models/post.dart';

/// business-logic & state-management for home/specific-day page.
class PostBloc extends Bloc<PostEvent, PostState> {
  /// constructs bloc.
  PostBloc(this._apiClient, this._token, this._appDocsDir)
      : super(const PostInitialState());

  final ApiClient _apiClient;
  final String _token;
  final Directory _appDocsDir;

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetchTodayEvent) {
      yield* _mapHomeFetchTodayEventToState(event);
    } else if (event is PostFetchSpecificEvent) {
      yield* _mapHomeFetchSpecificEventToState(event);
    }
  }

  Stream<PostState> _mapHomeFetchTodayEventToState(
    PostFetchTodayEvent event,
  ) async* {
    yield const PostLoadingState();
    try {
      if (event.fromLocalCache) {
        final cacheFile = File(join(_appDocsDir.path, todaysPostsTxtFile));
        final cacheExists = cacheFile.existsSync();
        if (cacheExists) {
          final cacheData = await cacheFile.readAsString();
          final decodedCache =
              List<Map<String, dynamic>>.from(jsonDecode(cacheData) as List);
          yield PostSuccessState(
            decodedCache.map((e) => Post.fromJson(e)).toList(),
          );
          return;
        }
      }
      final posts = await _apiClient.getTodayPosts(_token);
      yield PostSuccessState(posts.posts);
      await File(
        join(_appDocsDir.path, todaysPostsTxtFile),
      ).writeAsString(
        jsonEncode(posts.posts.map((e) => e.toJson()).toList()),
      );
    } on Exception catch (e) {
      yield PostErrorState(e.toString());
    }
  }

  Stream<PostState> _mapHomeFetchSpecificEventToState(
    PostFetchSpecificEvent event,
  ) async* {
    yield const PostLoadingState();
    try {
      final posts = await _apiClient.getSpecificDayPosts(
        _token,
        <String, dynamic>{
          'day': event.date,
        },
      );
      yield PostSuccessState(posts.posts);
    } on Exception catch (e) {
      yield PostErrorState(e.toString());
    }
  }
}
