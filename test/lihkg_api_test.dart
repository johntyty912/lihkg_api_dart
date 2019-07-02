import 'package:lihkg_api/lihkg_api.dart';
import 'package:lihkg_api/src/lihkg_api_methods.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  group('A group of tests', () {
    BaseResponse<LoginResponse> loginResponse;
    BaseResponse<PropertyResponse> propertyResponse;
    BaseResponse<CategoryResponse> categoryResponse;
    BaseResponse<PageResponse> pageResponse;

    setUp(() async {
      Map<String, dynamic> body = json.decode(await File('user.json').readAsString());
      loginResponse = await postLogin(body);
      propertyResponse = await getProperty();
      categoryResponse = await getCategory(
          propertyResponse.response.categoryList[0].url,
          propertyResponse.response.categoryList[0].query);
      Map<String, String> query = {"order": "reply_time"};
      pageResponse = await getPage(categoryResponse.response.items[0].threadID,
          page: 1, query: query);
    });

    test('Post Login Test', () {
      expect(loginResponse.success, 1);
    });

    test('Get Property Test', () {
      expect(propertyResponse.success, 1);
    });

    test('Get Category Test', () {
      expect(categoryResponse.success, 1);
    });

    test('Get Page Test', () {
      expect(pageResponse.success, 1);
    });
  });
}
