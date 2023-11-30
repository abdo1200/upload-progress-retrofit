import 'dart:io';

import 'package:dio/dio.dart';

/// path : ""
/// image : [""]

class UploadFilesRequest {
  UploadFilesRequest({this.path, this.image, this.onSendProgress});

  UploadFilesRequest.fromJson(dynamic json) {
    path = json['path'];
    image = json['image'] != null ? json['image'].cast<String>() : [];
  }
  String? path;
  List<File>? image;
  ProgressCallback? onSendProgress;
  UploadFilesRequest copyWith({
    String? path,
    List<File>? image,
  }) =>
      UploadFilesRequest(
        path: path ?? this.path,
        image: image ?? this.image,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['path'] = path;
    map['image'] = image;
    return map;
  }
}
