import 'package:flutter/material.dart';
import 'package:flutter_httpreq/app/data/providers/user_provider.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: Text("Loading.."));
          if (controller.allUsers.length == 0)
            return Center(child: Text("Tidak Ada Data.."));

          return ListView.builder(
            itemCount: controller.allUsers.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(controller.allUsers[index].avatar!),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("ID : ${controller.allUsers[index].id}"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Name : ${controller.allUsers[index].firstName} ${controller.allUsers[index].lastName}"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Email : ${controller.allUsers[index].email}"),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
