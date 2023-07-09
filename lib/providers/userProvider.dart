import 'dart:convert';

import 'package:get/get.dart';

class UserProvider extends GetConnect {
  // Get request
  // Future<Response> getUser(int id) => get('http://youapi/users/$id');
  // Post request
  final url = 'https://api-leads.owlandfoxes.co.id/auth/login';
  Future<Response> postUser(
      String id, String name, String email, String phone) {
    final body =
        jsonEncode({"id": id, "name": name, "email": email, "phone": phone});
    return post(url, body);
  }

  Future<Response> login(String email, String password) {
    final body = 
    jsonEncode({
      "email": email,
      "password": password
      });
    return post(url, body);
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
