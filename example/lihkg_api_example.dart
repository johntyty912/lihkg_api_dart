import 'dart:convert';
import 'dart:io';

import 'package:lihkg_api/lihkg_api.dart';

main() async {
  LihkgClient _client = new LihkgClient();
  Map<String, dynamic> body =
          json.decode(await File('user.json').readAsString());
  BaseResponse<LoginResponse> loginResponse = await _client.postLogin(body);
  print(loginResponse.response.me.userID);
}
