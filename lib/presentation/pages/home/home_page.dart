import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path/path.dart' as p;
import 'package:product_hunt_app/blocs/home/post_bloc.dart';
import 'package:product_hunt_app/blocs/home/post_event.dart';
import 'package:product_hunt_app/blocs/home/post_state.dart';
import 'package:product_hunt_app/core/constants/constants.dart';
import 'package:product_hunt_app/core/navigation/routes.dart';
import 'package:product_hunt_app/data/api/api_client.dart';
import 'package:product_hunt_app/data/api/api_key.dart';
import 'package:product_hunt_app/presentation/widgets/post_widget.dart';

/// This widget shows today's post.
class HomePage extends StatefulWidget {
  /// Constructs this widget.
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PostBloc _postBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home - Today's Posts"),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: _fetchPostsBasedOnInternet,
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            tooltip: 'Specific Day Posts',
            onPressed: () async {
              await Navigator.pushNamed(context, Routes.specificDayPage);
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: BlocConsumer<PostBloc, PostState>(
            bloc: _postBloc,
            listener: (context, state) async {
              if (state is PostErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              } else if (state is PostSuccessState && state.writeCache) {
                await File(
                  p.join(context.read<Directory>().path, todaysPostsTxtFile),
                ).writeAsString(
                  jsonEncode(state.posts.map((e) => e.toJson()).toList()),
                );
              }
            },
            builder: (context, state) {
              if (state is PostLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is PostSuccessState) {
                final posts = state.posts;
                return ListView.builder(
                  itemBuilder: (context, index) => PostWidget(
                    post: posts[index],
                  ),
                  itemCount: posts.length,
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _postBloc = PostBloc(
      context.read<ApiClient>(),
      token,
      context.read<Directory>(),
    );
    _fetchPostsBasedOnInternet();
  }

  void _fetchPostsBasedOnInternet() {
    InternetConnectionChecker().hasConnection.then((connected) {
      if (connected) {
        _postBloc.add(const PostFetchTodayEvent());
      } else {
        _postBloc.add(
          const PostFetchTodayEvent(
            fromLocalCache: true,
          ),
        );
      }
    });
  }
}
