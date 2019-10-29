import 'dart:math';

import 'package:lihkg_api/lihkg_api.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  group('A group of tests', () {
    BaseResponse<LoginResponse> loginResponse;
    BaseResponse<PropertyResponse> propertyResponse;
    BaseResponse<CategoryResponse> categoryResponse;
    BaseResponse<PageResponse> pageResponse;
    BaseResponse<SearchResponse> searchResponse;
    BaseResponse<ReplyResponse> replyResponse;

    LihkgClient _client;
    Random random;

    List<SubCategory> subCategoryList;
    SubCategory subCategory;

    List<Item> threadList;
    Item thread;

    setUp(() async {
      _client = new LihkgClient();
      random = new Random();
      Map<String, dynamic> body =
          json.decode(await File('user.json').readAsString());
      loginResponse = await _client.postLogin(body);
      propertyResponse = await _client.getProperty();
      subCategoryList = propertyResponse
          .response
          .categoryList[
              random.nextInt(propertyResponse.response.categoryList.length)]
          .subCategory;
      subCategory = subCategoryList[random.nextInt(subCategoryList.length)];
      categoryResponse = await _client.getCategory(subCategory, 1);
      // threadList = categoryResponse.response.items;
      // thread = threadList[random.nextInt(threadList.length)];
      // pageResponse = await _client.getPage(thread.threadID, page: 1);
      // searchResponse = await _client.getSearch('ali', sort: 'desc_reply_time');
      // pageResponse = await _client
      //     .getPage(searchResponse.response.items[0].threadID, page: 1);
    });

    test('Post Login Test', () {
      expect(loginResponse.success, 1);
    });

    test('Get Property Test', () {
      expect(propertyResponse.success, 1);
    });

    test('Get Category Test', () {
      print("${subCategory.url}, ${subCategory.query}");
      expect(categoryResponse.success, 1);
    });

    // test('Get Page Test', () {
    //   expect(pageResponse.success, 1);
    // });

    // test('Get Search Test', () {
    //   expect(searchResponse.success, 1);
    // });
  });
}
