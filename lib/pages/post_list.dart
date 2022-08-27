import 'package:finam/pages/current_post.dart';
import 'package:finam/model/reddit.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late Future<Reddit> postsList;
  @override
  void initState() {
    postsList = getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reddit"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 500));
          setState(() {
            postsList = getList();
          });
        },
        child: FutureBuilder<Reddit>(
          future: postsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.data.children.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text(snapshot
                              .data!.data.children[index].postData.title),
                          leading: snapshot.data!.data.children[index].postData
                                          .thumbnail !=
                                      'default' &&
                                  snapshot.data!.data.children[index].postData
                                          .thumbnail !=
                                      'self'
                              ? Image.network(snapshot.data!.data
                                  .children[index].postData.thumbnail)
                              : null,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CurrentPost(
                                        postInfo:
                                            snapshot.data!.data.children[index],
                                      )))),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Text('Error');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
