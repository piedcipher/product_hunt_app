/// base event for PostBloc.
abstract class PostEvent {
  /// constructs event.
  const PostEvent();
}

/// fetches today's posts from the API.
class PostFetchTodayEvent extends PostEvent {
  /// constructs event.
  const PostFetchTodayEvent({this.fromLocalCache = false});

  /// fetch today's post from local cache.
  final bool fromLocalCache;
}

/// fetches specific day's posts from the API.
class PostFetchSpecificEvent extends PostEvent {
  /// constructs event.
  const PostFetchSpecificEvent(this.date);

  /// specific day (date)
  final String date;
}
