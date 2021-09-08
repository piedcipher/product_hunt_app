import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_hunt_app/blocs/comments/comments_bloc.dart';
import 'package:product_hunt_app/blocs/comments/comments_event.dart';
import 'package:product_hunt_app/blocs/comments/comments_state.dart';
import 'package:product_hunt_app/data/api/api_client.dart';
import 'package:product_hunt_app/data/api/api_key.dart';
import 'package:product_hunt_app/models/comment.dart';
import 'package:product_hunt_app/models/post.dart';

/// shows comments of a post.
class CommentsPage extends StatefulWidget {
  /// constructs comments page.
  const CommentsPage({Key? key, required this.post}) : super(key: key);

  /// specific post item.
  final Post post;

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  int _page = 1;
  final List<Comment> _comments = [];
  late CommentsBloc _commentsBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            widget.post.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text(
            'Comments',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                BlocConsumer<CommentsBloc, CommentsState>(
                  bloc: _commentsBloc,
                  listener: (context, state) {
                    if (state is CommentsErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is CommentsSuccessState) {
                      _page++;
                      _comments.addAll(state.comments);
                    }
                    return Column(
                      children: _comments.map(
                        (e) {
                          return Column(
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ListTile(
                                    title: Text(e.body),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
                const SizedBox(height: 10),
                StreamBuilder<CommentsState>(
                  stream: _commentsBloc.stream,
                  builder: (context, snapshot) => ElevatedButton(
                    onPressed: snapshot.data is CommentsLoadingState
                        ? null
                        : () {
                            _commentsBloc
                                .add(CommentsFetchEvent(widget.post.id, _page));
                          },
                    child: const Text('Load More'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _commentsBloc = CommentsBloc(context.read<ApiClient>(), token)
      ..add(CommentsFetchEvent(widget.post.id, _page));
  }

  @override
  void dispose() {
    _commentsBloc.close();
    super.dispose();
  }
}
