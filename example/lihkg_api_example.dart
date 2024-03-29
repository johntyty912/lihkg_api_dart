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
  print(loginResponse.success == 1? "login success": "fail: ${replyResponse.errorMessage}");

  String threadID = "1304081";
  String content = "PUSH";

  const oneSec = const Duration(seconds:1);
  const fiveSec = const Duration(seconds:5);
  Timer.periodic(oneSec, (Timer t) async {
    // replyResponse = await _client.postReply(threadID, content);
    // print(replyResponse.success == 1? "reply success": "fail: ${replyResponse.errorMessage}");
    print("hihihi");
  });
  print("hi");
}
