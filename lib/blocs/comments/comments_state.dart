import 'package:product_hunt_app/models/comment.dart';

/// base state for CommentsBloc.
abstract class CommentsState {
  /// constructs state.
  const CommentsState();
}

/// first state for comments page.
class CommentsInitialState extends CommentsState {
  /// constructs state.
  const CommentsInitialState();
}

/// loading state for comments page.
class CommentsLoadingState extends CommentsState {
  /// constructs state.
  const CommentsLoadingState();
}

/// success state for comments page.
class CommentsSuccessState extends CommentsState {
  /// constructs state.
  const CommentsSuccessState(this.comments);

  /// comments fetched from API.
  final List<Comment> comments;
}

/// error state for comments page.
class CommentsErrorState extends CommentsState {
  /// constructs state.
  const CommentsErrorState(this.error);

  /// error occurred while fetching comments from API.
  final String error;
}
