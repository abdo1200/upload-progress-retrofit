import 'package:progress/features/auth/data/remote/models/remote_response.dart';

///  : null

class EmptyResponse extends Serializable {
  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    return map;
  }

  EmptyResponse.fromJson(dynamic json);
}
