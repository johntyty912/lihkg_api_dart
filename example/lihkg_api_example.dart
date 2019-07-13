import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:lihkg_api/lihkg_api.dart';

main() async {
  LihkgClient _client = new LihkgClient();
  BaseResponse<LoginResponse> loginResponse;
  BaseResponse<ReplyResponse> replyResponse;

  Map<String, dynamic> loginBody =
          json.decode(await File('user.json').readAsString());
  loginResponse = await _client.postLogin(loginBody);

  String threadID = "1302846";
  String content = "PUSH";

  const oneMin = const Duration(seconds:60);
  Timer.periodic(oneMin, (Timer t) async {
    replyResponse = await _client.postReply(threadID, content);
  });
}
