import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:state_provider_example/models/serializers.dart';

part 'stories.g.dart';

abstract class Stories implements Built<Stories, StoriesBuilder> {
  int get id;

  @nullable
  bool get deleted;
  String get type;
  @nullable
  String get by;
  @nullable
  int get time;
  @nullable
  bool get dead;
  @nullable
  int get parent;
  @nullable
  int get poll;
  BuiltList<int> get kids;
  @nullable
  String get url;
  @nullable
  String get title;
  BuiltList<int> get parts;
  @nullable
  int get descendants;

  Stories._();

  factory Stories([updates(StoriesBuilder b)]) = _$Stories;
  static Serializer<Stories> get serializer => _$storiesSerializer;
}

Stories parseStories(String jsonString) {
  final parsed = jsonDecode(jsonString);
  Stories stories =
      standardSerializers.deserializeWith(Stories.serializer, parsed);

  return stories;
}
