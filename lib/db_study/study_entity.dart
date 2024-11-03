import 'dart:convert';
import 'dart:typed_data';

class StudyEntity {
  DateTime createTime;
  Uint8List image;
  String title;
  String content;

  StudyEntity({
    required this.createTime,
    required this.image,
    required this.title,
    required this.content,
  });

  factory StudyEntity.fromJson(Map<String, dynamic> json) {
    return StudyEntity(
      createTime: DateTime.parse(json['createTime']),
      image: base64Decode(json['image']),
      title: json['title'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createTime': createTime.toIso8601String(),
      'image': base64Encode(image),
      'title': title,
      'content': content,
    };
  }
}

class TypeEntity {
  int id;
  DateTime createTime;
  String title;
  List<StudyEntity> list;

  TypeEntity({
    required this.id,
    required this.createTime,
    required this.title,
    required this.list,
  });

  factory TypeEntity.fromJson(Map<String, dynamic> json) {
    return TypeEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      title: json['title'],
      list: (jsonDecode(json['list']) as List)
          .map((e) => StudyEntity.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'title': title,
      'list': jsonEncode(list.map((e) => e.toJson()).toList()),
    };
  }
}
