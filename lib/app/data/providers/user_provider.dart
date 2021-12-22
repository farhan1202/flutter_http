import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://reqres.in/';
  }

  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<List<User>?> getAllUser(int id) async {
    final response = await get('https://reqres.in/api/users?page=$id');
    if ((response.body["data"] as List).length == 0) {
      return null;
    }
    List<User> allUser = [];

    (response.body['data'] as List).forEach((element) {
      allUser.add(User.fromJson(element));
    });
    return allUser;
  }

  Future<Response<User>> postUser(User user) async => await post('user', user);
  Future<Response> deleteUser(int id) async => await delete('user/$id');
}
