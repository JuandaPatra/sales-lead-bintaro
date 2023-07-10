import 'package:flutter/material.dart';
import '../screens/homepage.dart';
import 'package:flutter_sales_lead/pages/leads.dart';
import 'package:get/get.dart';
import '../models/user.dart';
import 'package:get_storage/get_storage.dart';
import '../providers/userProvider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserController extends GetxController {
  final storage = const FlutterSecureStorage();
  var isLogin = false.obs;
  var hidden = true.obs;
  var isTokenAuth = false.obs;
  var users = List<User>.empty().obs;

  var authUser = List<Map<String, dynamic>>.empty().obs;

  var username = ''.obs;
  var emailSave = ''.obs;

  var leadsPage = false.obs;

  late TextEditingController emailC;
  late TextEditingController password;

  @override
  void onInit() async {
    super.onInit();
    // nameC = TextEditingController();
    emailC = TextEditingController();
    password = TextEditingController();
    await GetStorage.init();
    // final data = GetStorage();
    // if (data.read("dataUser")) {
    //   final dataStore = data.read("dataUser") as Map<String, dynamic>;
    //   emailC.text = dataStore['email'];
    //   password.text = dataStore['password'];
    // }
    String? value = await storage.read(key: 'data');
    bool hasExpired = JwtDecoder.isExpired(value.toString());

    if (hasExpired == false) {
      isTokenAuth.value = true;
      isLogin.value = true;
      Future.delayed(const Duration(seconds: 5), () {
        leadsPage.value = true;
      });
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    password.dispose();
    super.onClose();
  }

  void snackBarError(String msg) {
    Get.snackbar(
      "ERROR",
      msg,
      duration: const Duration(seconds: 2),
    );
  }

  void snackBarLoginSuccess(String msg) {
    Get.snackbar("Success", msg, duration: const Duration(seconds: 10));
  }

  Future<void> setToken(String msg) async {
    await storage.write(key: 'data', value: msg);

    String? value = await storage.read(key: 'data');
    isLogin.value = true;

    bool hasExpired = JwtDecoder.isExpired(value.toString());
    if (hasExpired == false) {
      isTokenAuth.value = true;
    }
    // print(hasExpired);
    // print(dateExpired);
    // if (hasExpired) {
    //   print(hasExpired);
    //   // Get.to(MyHomePage());
    // }
  }

  // void add(String name, String email, String phone) {
  //   if (name != '' && email != '' && phone != '') {
  //     if (email.contains("@")) {
  //       users.add(
  //         User(
  //           id: DateTime.now().toString(),
  //           name: name,
  //           email: email,
  //           phone: phone,
  //         ),
  //       );
  //       Get.back();
  //       // Get.dialog(AlertDialog(title: Text('ini text'),content: Text('Nama${name}, Email ${email}, password = ${phone}'),));
  //       UserProvider().postUser(DateTime.now().toString(),name,email,phone).then((value) => print(value.body)).catchError(()=>printError());
  //     } else {
  //       snackBarError("Masukan email valid");
  //     }
  //   } else {
  //     snackBarError("Semua data harus diisi");
  //   }
  // }

  void login(String email, String password) async {
    if (email != '' && password != '') {
      if (email.contains("@")) {
        await GetStorage.init();
        UserProvider().login(email, password).then((res) {
          final result = res.body as Map<String, dynamic>;
          final resultData = result['data'] as Map<String, dynamic>;
          final tokenId = resultData['token'];
          snackBarLoginSuccess(tokenId.toString());
          setToken(tokenId);
          username.value = resultData['username'];
          emailSave.value = resultData['email'];

          // data.remove('dataUser');
          // data.write('dataUser', {
          //   'email':email,
          //   'password':password
          // });
          // isLogin.value = true;
        }).catchError(() => printError());
      } else {
        snackBarError("Masukan email valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  //logout controller
  void logout() async {
    await storage.delete(key: 'data');
    isLogin.value = false;
    isTokenAuth.value = false;
    hidden.value = false;
  }
}
