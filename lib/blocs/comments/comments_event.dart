/// base event for CommentsBloc.
abstract class CommentsEvent {
  /// constructs event.
  const CommentsEvent();
}

/// fetches comments from the API.
class CommentsFetchEvent extends CommentsEvent {
  /// constructs event.
  const CommentsFetchEvent(this.postId, this.page);

  /// id of the post.
  final int postId;

  /// page number.
  final int page;
}
