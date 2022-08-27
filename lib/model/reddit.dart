import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'reddit.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Reddit {
  String kind;
  Data data;

  Reddit({required this.kind, required this.data});

  factory Reddit.fromJson(Map<String, dynamic> json) => _$RedditFromJson(json);
  Map<String, dynamic> toJson() => _$RedditToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Data {
  int dist;
  List<Children> children;
  Data({required this.dist, required this.children});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Children {
  @JsonKey(name: 'data')
  PostData postData;
  Children({required this.postData});

  factory Children.fromJson(Map<String, dynamic> json) =>
      _$ChildrenFromJson(json);
  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PostData {
  String thumbnail;
  String title;
  String selftext;
  int ups;

  PostData(
      {required this.thumbnail,
      required this.title,
      required this.selftext,
      required this.ups});

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}

Future<Reddit> getList() async {
  const url = 'https://www.reddit.com/r/flutterdev/new.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Reddit.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
