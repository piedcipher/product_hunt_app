import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:product_hunt_app/blocs/home/post_bloc.dart';
import 'package:product_hunt_app/blocs/home/post_event.dart';
import 'package:product_hunt_app/blocs/home/post_state.dart';
import 'package:product_hunt_app/data/api/api_client.dart';
import 'package:product_hunt_app/data/api/api_key.dart';
import 'package:product_hunt_app/presentation/widgets/post_widget.dart';

/// shows post of specific day.
class SpecificDayPage extends StatefulWidget {
  /// constructs page.
  const SpecificDayPage({Key? key}) : super(key: key);

  @override
  _SpecificDayPageState createState() => _SpecificDayPageState();
}

class _SpecificDayPageState extends State<SpecificDayPage> {
  late PostBloc _postBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Specific Day Posts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now().subtract(const Duration(days: 1)),
            firstDate: DateTime(2013, 12),
            lastDate: DateTime.now().subtract(const Duration(days: 1)),
          );
          if (date != null) {
            _postBloc.add(
              PostFetchSpecificEvent(DateFormat('y-M-d').format(date)),
            );
          }
        },
        child: const Icon(Icons.calendar_today),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: BlocConsumer<PostBloc, PostState>(
            bloc: _postBloc,
            listener: (context, state) {},
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
  }

  @override
  void dispose() {
    _postBloc.close();
    super.dispose();
  }
}
