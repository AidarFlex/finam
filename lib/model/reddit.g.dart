// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reddit _$RedditFromJson(Map<String, dynamic> json) => Reddit(
      kind: json['kind'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedditToJson(Reddit instance) => <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dist: json['dist'] as int,
      children: (json['children'] as List<dynamic>)
          .map((e) => Children.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'dist': instance.dist,
      'children': instance.children.map((e) => e.toJson()).toList(),
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
      postData: PostData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'data': instance.postData.toJson(),
    };

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      thumbnail: json['thumbnail'] as String,
      title: json['title'] as String,
      selftext: json['selftext'] as String,
      ups: json['ups'] as int,
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'selftext': instance.selftext,
      'ups': instance.ups,
    };
