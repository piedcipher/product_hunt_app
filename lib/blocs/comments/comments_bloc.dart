import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt_app/blocs/comments/comments_event.dart';
import 'package:product_hunt_app/blocs/comments/comments_state.dart';
import 'package:product_hunt_app/data/api/api_client.dart';

/// business-logic & state-management for comments page.
class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  /// constructs bloc.
  CommentsBloc(this._apiClient, this._token)
      : super(const CommentsInitialState());

  final ApiClient _apiClient;
  final String _token;

  @override
  Stream<CommentsState> mapEventToState(CommentsEvent event) async* {
    if (event is CommentsFetchEvent) {
      yield* _mapCommentsFetchEventToState(event);
    }
  }

  Stream<CommentsState> _mapCommentsFetchEventToState(
    CommentsFetchEvent event,
  ) async* {
    yield const CommentsLoadingState();
    try {
      final comments = await _apiClient.getComments(
        _token,
        <String, dynamic>{
          'per_page': 5,
          'page': event.page,
          'search[post_id]': event.postId,
        },
      );
      yield CommentsSuccessState(comments.comments);
    } on Exception catch (e) {
      yield CommentsErrorState(e.toString());
    }
  }
}
