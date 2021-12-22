import 'package:flutter_httpreq/app/data/models/user_model.dart';
import 'package:flutter_httpreq/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxList<User> allUsers = List<User>.empty().obs;

  UserProvider userProvider = UserProvider();

  Future<void> getData() async {
    var data = await userProvider.getAllUser(1);

    if (data != null) {
      data.forEach((element) {
        allUsers.add(element);
      });
      allUsers.refresh();
    }
  }
}
