// /// data : null
// /// message : "Created"
// /// success : true
//
// class RemoteResponse<T> {
//   RemoteResponse({
//       T? data,
//       String? message,
//       bool? success,
//       Map<String,String>? errors}){
//     _data = data;
//     _message = message;
//     _success = success;
//     _errors = errors;
// }
//
//   RemoteResponse.fromJson(dynamic json) {
//     _data =  json['data'];
//     _message = json['message'];
//     _success = json['success'];
//     _errors = json['errors'];
//   }
//
//   T? _data;
//   String? _message;
//   bool? _success;
//   Map<String,String>? _errors;
//
//   T? get data => _data;String, dynamic>{};
// //     map['data'] = _data;
// //     map['message'] = _message;
// //     map['success'] = _success;
// //     map['errors'] = _errors;
// //     return map;
//   String? get message => _message;
//   bool? get success => _success;
//   Map<String,String>? get errors => _errors;
//
//   Map<String, dynamic> toJson() {
//     final map = <
//   }
// }
// abstract class  BaseResponse{ BaseResponse.fromJson(Map<String, dynamic> json);}
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class RemoteResponse<T> {
  bool? status;
  String message;
  // Map<String, dynamic>? errors;
  T data;

  RemoteResponse(
      {required this.status, required this.message, required this.data});

  factory RemoteResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return RemoteResponse<T>(
      //   errors: json["errors"] ?? {},
      status: json["success"],
      message: json["message"],
      data: create(json["data"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        //  "errors": this.errors,
        "success": this.status,
        "message": this.message,
        "data": this.data,
      };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
