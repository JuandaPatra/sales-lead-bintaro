import 'package:flutter/material.dart';
import 'package:flutter_sales_lead/controller/userController.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  final profileC = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {},
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
              ),
              contentPadding: const EdgeInsets.all(10),
              title: profileC.emailSave.isEmpty
                  ? const Text("MY PROFILE")
                  : Text(profileC.emailSave.value),
            ),
            SizedBox(
              // height: 35,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: const Align(
                  alignment: Alignment(-1.3, 0),
                  child: Text("Home"),
                ),
              ),
            ),
            SizedBox(
              height: 35,
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.person),
                title: const Align(
                  alignment: Alignment(-1.3, 0),
                  child: Text("Profile"),
                ),
              ),
            ),
            Obx(
              () => SizedBox(
                height: 35,
                child: ListTile(
                  onTap: () => profileC.logout(),
                  leading: profileC.isLogin.isTrue
                      ? const Icon(Icons.logout)
                      : const Icon(Icons.login),
                  title: Align(
                    alignment: const Alignment(-1.3, 0),
                    child: profileC.isLogin.isTrue
                        ? const Text("Logout")
                        : const Text("Login"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
