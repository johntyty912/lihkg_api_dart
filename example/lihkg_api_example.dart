import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:io';

import 'package:lihkg_api/lihkg_api.dart';

main() async {
  LihkgClient _client = new LihkgClient();
  BaseResponse<LoginResponse> loginResponse;
  BaseResponse<ReplyResponse> replyResponse;

  Map<String, dynamic> loginBody =
          json.decode(await File('user.json').readAsString());
  loginResponse = await _client.postLogin(loginBody);

  // String threadID = "1302846";
  // String content = "PUSH";

  // replyResponse = await _client.postReply(threadID, content);
}
