import 'package:finam/model/reddit.dart';
import 'package:flutter/material.dart';

class CurrentPost extends StatelessWidget {
  final Children postInfo;
  const CurrentPost({Key? key, required this.postInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(postInfo.postData.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Количество плюсов: ${postInfo.postData.ups}'),
              const SizedBox(height: 10),
              Text(postInfo.postData.selftext),
            ],
          ),
        ),
      ),
    );
  }
}
