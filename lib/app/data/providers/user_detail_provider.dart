import 'package:get/get.dart';

import '../models/user_detail_model.dart';

class UserDetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return UserDetail.fromJson(map);
      if (map is List)
        return map.map((item) => UserDetail.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<UserDetail?> getUserDetail(int id) async {
    final response = await get('userdetail/$id');
    return response.body;
  }

  Future<Response<UserDetail>> postUserDetail(UserDetail userdetail) async =>
      await post('userdetail', userdetail);
  Future<Response> deleteUserDetail(int id) async =>
      await delete('userdetail/$id');
}
