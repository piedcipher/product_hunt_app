import 'package:product_hunt_app/models/post.dart';

/// base state for PostBloc.
abstract class PostState {
  /// constructs state.
  const PostState();
}

/// first state for home/specific day page.
class PostInitialState extends PostState {
  /// constructs state.
  const PostInitialState();
}

/// loading state for home/specific day page.
class PostLoadingState extends PostState {
  /// constructs state.
  const PostLoadingState();
}

/// success state for home/specific day page.
class PostSuccessState extends PostState {
  /// constructs state.
  const PostSuccessState(this.posts, {this.writeCache = false});

  /// post fetched from API.
  final List<Post> posts;

  /// flag to write or not write cache.
  final bool writeCache;
}

/// error state for home/specific day page.
class PostErrorState extends PostState {
  /// constructs state.
  const PostErrorState(this.error);

  /// error occurred while fetching posts from API.
  final String error;
}
