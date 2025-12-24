import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProvider extends GetConnect {
  // Get request
  // Future<Response> getUser(int id) => get('http://youapi/users/$id');
  // Post request
  final url = 'https://api-leads.owlandfoxes.co.id/auth/login';
  final urlLeads = 'https://api-leads.owlandfoxes.co.id/leads';
  Future<Response> postUser(
      String id, String name, String email, String phone) {
    final body =
        jsonEncode({"id": id, "name": name, "email": email, "phone": phone});
    return post(url, body);
  }

  Future<Response> login(String email, String password) {
    final body = jsonEncode({"email": email, "password": password});
    return post(url, body);
  }

  final storage = const FlutterSecureStorage();
  Future<dynamic> leads() async {
    // String? bearer = await storage.read(key: 'data');
    String urlLeads2 =
        'https://api.srv.bintarojaya.id/leads?status=Hot,Cold&pipeline=New,Pending Response';
    String bearer =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzAsInVzZXJuYW1lIjoibWFuYWdlciIsImVtYWlsIjoicHV0cmlhaXN5YWgyNDVAZ21haWwuY29tIiwicm9sZSI6MSwiaWF0IjoxNjg5MTY0MjkzLCJleHAiOjE3MjA3MDAyOTMsImlzcyI6Ik93bCZGb3hlcyJ9.pq3Vxi4_w6lcfbFsgXhlt510RBYk547Ziv5KEU6XspU';

    return get(urlLeads2, headers: {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "Authorization": "Bearer $bearer"
    });

    // return get(urlLeads2, headers: {
    //   "Accept": "*/*",
    //   "Content-Type": "application/json",
    //   "Authorization": "Bearer $bearer"
    // }).then((value) {
    //   // return value;
    //   if (value.toString().isEmpty) {
    //     print('salah');
    //   } else {
    //     // print(value.body.toString());
    //     print(value.body['data'].toString());
    //   }
    // });
  }
  // Post request with File
  // Future<Response<CasesModel>> postCases(List<int> image) {
  //   final form = FormData({
  //     'file': MultipartFile(image, filename: 'avatar.png'),
  //     'otherFile': MultipartFile(image, filename: 'cover.png'),
  //   });
  //   return post('http://youapi/users/upload', form);
  // }

  // GetSocket userMessages() {
  //   return socket('https://yourapi/users/socket');
  // }
}
