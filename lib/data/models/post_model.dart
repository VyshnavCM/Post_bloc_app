// ignore_for_file: must_be_immutable

import 'package:api_handling_uisng_bloc/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required body, required id, required title, required userId})
      : super(id: id, body: body, userId: userId, title: title);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        body: json['body'],
        id: json['id'],
        title: json['title'],
        userId: json['userId']);
  }
}
