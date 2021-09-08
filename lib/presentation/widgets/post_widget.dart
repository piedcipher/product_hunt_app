import 'package:flutter/material.dart';
import 'package:product_hunt_app/core/navigation/routes.dart';
import 'package:product_hunt_app/models/post.dart';

/// reusable post widget.
class PostWidget extends StatelessWidget {
  /// constructs reusable post widget.
  const PostWidget({Key? key, required this.post}) : super(key: key);

  /// specific post item.
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            await Navigator.pushNamed(
              context,
              Routes.commentsPage,
              arguments: post,
            );
          },
          child: Card(
            child: Column(
              children: [
                Image.network(post.thumbnail.imageUrl),
                ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  title: Text(
                    post.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(post.tagline),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
