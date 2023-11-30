/// files : [{"file_name":"cw3BQ5prjkZcFz2m1689874769.jpg","path":"http://dev.goldenhost.co/public/images/users/cw3BQ5prjkZcFz2m1689874769.jpg"}]

class UploadFileResponse {
  UploadFileResponse({
    this.files,
  });

  UploadFileResponse.fromJson(dynamic json) {
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
  }
  List<Files>? files;
  UploadFileResponse copyWith({
    List<Files>? files,
  }) =>
      UploadFileResponse(
        files: files ?? this.files,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// file_name : "cw3BQ5prjkZcFz2m1689874769.jpg"
/// path : "http://dev.goldenhost.co/public/images/users/cw3BQ5prjkZcFz2m1689874769.jpg"

class Files {
  Files({
    this.fileName,
    this.path,
  });

  Files.fromJson(dynamic json) {
    fileName = json['file_name'];
    path = json['path'];
  }
  String? fileName;
  String? path;
  Files copyWith({
    String? fileName,
    String? path,
  }) =>
      Files(
        fileName: fileName ?? this.fileName,
        path: path ?? this.path,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file_name'] = fileName;
    map['path'] = path;
    return map;
  }
}
