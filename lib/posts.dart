import 'package:flutter/material.dart';
import 'http_service.dart';
import 'milks.dart';
import 'post_model.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Milks>> snapshot) {
          if (snapshot.hasData) {
            List<Milks> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (Milks post) => ListTile(
                  title: Text(post.name),
                  subtitle: Text("${post.price}"),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}