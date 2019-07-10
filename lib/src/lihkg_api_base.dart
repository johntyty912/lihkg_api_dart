import 'package:json_annotation/json_annotation.dart';

part 'lihkg_api_base.g.dart';

@JsonSerializable()
class BaseResponse<T> {
  BaseResponse({
    this.errorCode,
    this.errorMessage,
    this.serverTime,
    this.success,
    this.response,
  });

  @JsonKey(name: 'server_time')
  final int serverTime;
  @JsonKey(name: 'error_code')
  final int errorCode;
  @JsonKey(name: 'error_message')
  final String errorMessage;
  final int success;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final T response;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  static T _dataFromJson<T>(Map<String, dynamic> json) {
    if (json == null) return null;
    switch (T) {
      case PropertyResponse:
        return PropertyResponse.fromJson(json) as T;
        break;
      case CategoryResponse:
        return CategoryResponse.fromJson(json) as T;
        break;
      case PageResponse:
        return PageResponse.fromJson(json) as T;
        break;
      case LoginResponse:
        return LoginResponse.fromJson(json) as T;
        break;
      case SearchResponse:
        return SearchResponse.fromJson(json) as T;
        break;
      case LikeResponse:
        return LikeResponse.fromJson(json) as T;
        break;
      case ReplyResponse:
        return ReplyResponse.fromJson(json) as T;
        break;
      case CreateResponse:
        return CreateResponse.fromJson(json) as T;
        break;
      default:
        throw Exception("Unknow type");
    }
  }

  static Map<String, dynamic> _dataToJson<T>(T response) => {'response': response};
}

@JsonSerializable()
class PropertyResponse {
  PropertyResponse({
    this.lihkg,
    this.categoryList,
    this.fixedCategoryList,
    this.categoryOrder,
    this.me,
    this.config,
  });

  factory PropertyResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PropertyResponseToJson(this);

  final bool lihkg;
  @JsonKey(name: 'category_list')
  final List<Category> categoryList;
  @JsonKey(name: 'fixed_category_list')
  final List<FixedCategory> fixedCategoryList;
  @JsonKey(name: 'category_order')
  final List<String> categoryOrder;
  final User me;
  final dynamic config;
}

@JsonSerializable()
class CategoryResponse {
  CategoryResponse({
    this.category,
    this.isPagination,
    this.items,
    this.me,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

  final Category category;
  @JsonKey(name: 'is_pagination')
  final bool isPagination;
  final List<Item> items;
  final User me;
}

@JsonSerializable()
class SearchResponse {
  SearchResponse({
    this.category,
    this.isPagination,
    this.items,
    this.me,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);

  final Category category;
  @JsonKey(name: 'is_pagination')
  final bool isPagination;
  final List<Item> items;
  final User me;
}

@JsonSerializable()
class PageResponse {
  PageResponse({
    this.threadID,
    this.catID,
    this.subCatID,
    this.title,
    this.userID,
    this.userNickname,
    this.userGender,
    this.noOfReply,
    this.noOfUniUserReply,
    this.likeCount,
    this.dislikeCount,
    this.replyLikeCount,
    this.replyDislikeCount,
    this.maxReplyLikeCount,
    this.maxReplyDislikeCount,
    this.createTime,
    this.lastReplyTime,
    this.status,
    this.isAdu,
    this.remark,
    this.lastReplyUserID,
    this.maxReply,
    this.totalPage,
    this.isHot,
    this.category,
    this.isBookmarked,
    this.isReplied,
    this.user,
    this.page,
    this.itemData,
    this.me,
  });

  factory PageResponse.fromJson(Map<String, dynamic> json) =>
      _$PageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PageResponseToJson(this);

  @JsonKey(name: 'thread_id')
  final String threadID;
  @JsonKey(name: 'cat_id')
  final String catID;
  @JsonKey(name: 'sub_cat_id')
  final String subCatID;
  final String title;
  @JsonKey(name: 'user_id')
  final String userID;
  @JsonKey(name: 'user_nickname')
  final String userNickname;
  @JsonKey(name: 'user_gender')
  final String userGender;
  @JsonKey(name: 'no_of_reply')
  final String noOfReply;
  @JsonKey(name: 'no_of_uni_user_reply')
  final String noOfUniUserReply;
  @JsonKey(name: 'like_count')
  final dynamic likeCount;
  @JsonKey(name: 'dislike_count')
  final dynamic dislikeCount;
  @JsonKey(name: 'reply_like_count')
  final String replyLikeCount;
  @JsonKey(name: 'reply_dislike_count')
  final String replyDislikeCount;
  @JsonKey(name: 'max_reply_like_count')
  final String maxReplyLikeCount;
  @JsonKey(name: 'max_reply_dislike_count')
  final String maxReplyDislikeCount;
  final String status;
  @JsonKey(name: 'last_reply_user_id')
  final String lastReplyUserID;
  @JsonKey(name: 'max_reply')
  final String maxReply;
  final String page;
  @JsonKey(name: 'create_time')
  final int createTime;
  @JsonKey(name: 'last_reply_time')
  final int lastReplyTime;
  @JsonKey(name: 'total_page')
  final int totalPage;
  @JsonKey(name: 'is_adu')
  final bool isAdu;
  @JsonKey(name: 'is_hot')
  final bool isHot;
  @JsonKey(name: 'is_bookmarked')
  final bool isBookmarked;
  @JsonKey(name: 'is_replied')
  final bool isReplied;
  final Remark remark;
  final Category category;
  final User user;
  @JsonKey(name: 'item_data')
  final List<ItemData> itemData;
  final User me;
}

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.token,
    this.keywordFilterList,
    this.categoryOrder,
    this.user,
    this.fixedCategoryList,
    this.me,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  final String token;
  @JsonKey(name: "keyword_filter_list")
  final List keywordFilterList;
  @JsonKey(name: "category_order")
  final List<String> categoryOrder;
  final User user;
  @JsonKey(name: "fixed_category_list")
  final List<FixedCategory> fixedCategoryList;
  final User me;
}

@JsonSerializable()
class LikeResponse {
  LikeResponse({
    this.isLike,
    this.isUpvote,
    this.thread,
    this.post,
    this.me,
  });

  factory LikeResponse.fromJson(Map<String, dynamic> json) =>
      _$LikeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LikeResponseToJson(this);

  @JsonKey(name: 'is_like')
  final bool isLike;
  @JsonKey(name: 'is_upvote')
  final bool isUpvote;
  final Item thread;
  final ItemData post;
  final User me;
}

@JsonSerializable()
class ReplyResponse {
  ReplyResponse({
    this.noOfReply,
    this.threadID,
    this.totalPage,
    this.me,
  });

  factory ReplyResponse.fromJson(Map<String, dynamic> json) =>
      _$ReplyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyResponseToJson(this);

  @JsonKey(name: 'no_of_reply')
  final int noOfReply;
  @JsonKey(name: 'thread_id')
  final String threadID;
  @JsonKey(name: 'total_page')
  final int totalPage;
  final User me;
}

@JsonSerializable()
class CreateResponse {
  CreateResponse({
    this.threadID,
    this.me,
  });

  factory CreateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateResponseToJson(this);

  @JsonKey(name: 'thread_id')
  final String threadID;
  final User me;
}

@JsonSerializable()
class ItemData {
  ItemData({
    this.postID,
    this.quotePostID,
    this.threadID,
    this.userNickname,
    this.userGender,
    this.likeCount,
    this.dislikeCount,
    this.voteScore,
    this.noOfQuote,
    this.status,
    this.replyTime,
    this.msgNum,
    this.msg,
    this.user,
    this.page,
    this.quote,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) =>
      _$ItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDataToJson(this);

  @JsonKey(name: "post_id")
  final String postID;
  @JsonKey(name: "quote_post_id")
  final String quotePostID;
  @JsonKey(name: "thread_id")
  final String threadID;
  @JsonKey(name: "user_nickname")
  final String userNickname;
  @JsonKey(name: "user_gender")
  final String userGender;
  @JsonKey(name: "like_count")
  final dynamic likeCount;
  @JsonKey(name: "dislike_count")
  final dynamic dislikeCount;
  @JsonKey(name: "vote_score")
  final String voteScore;
  @JsonKey(name: "no_of_quote")
  final String noOfQuote;
  @JsonKey(name: "msg_num")
  final String msgNum;
  final String msg;
  @JsonKey(name: "reply_time")
  final int replyTime;
  final int page;
  final dynamic status;
  final User user;
  final ItemData quote;
}

@JsonSerializable()
class Item {
  Item({
    this.threadID,
    this.catID,
    this.subCatID,
    this.title,
    this.userID,
    this.userNickname,
    this.userGender,
    this.noOfReply,
    this.noOfUniUserReply,
    this.likeCount,
    this.dislikeCount,
    this.replyLikeCount,
    this.replyDislikeCount,
    this.maxReplyLikeCount,
    this.maxReplyDislikeCount,
    this.createTime,
    this.lastReplyTime,
    this.status,
    this.isAdu,
    this.remark,
    this.lastReplyUserID,
    this.maxReply,
    this.totalPage,
    this.isHot,
    this.category,
    this.isBookmarked,
    this.isReplied,
    this.user,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @JsonKey(name: 'thread_id')
  final String threadID;
  @JsonKey(name: 'cat_id')
  final String catID;
  @JsonKey(name: 'sub_cat_id')
  final String subCatID;
  final String title;
  @JsonKey(name: 'user_id')
  final String userID;
  @JsonKey(name: 'user_nickname')
  final String userNickname;
  @JsonKey(name: 'user_gender')
  final String userGender;
  @JsonKey(name: 'no_of_reply')
  final String noOfReply;
  @JsonKey(name: 'no_of_uni_user_reply')
  final String noOfUniUserReply;
  @JsonKey(name: 'like_count')
  final dynamic likeCount;
  @JsonKey(name: 'dislike_count')
  final dynamic dislikeCount;
  @JsonKey(name: 'reply_like_count')
  final String replyLikeCount;
  @JsonKey(name: 'reply_dislike_count')
  final String replyDislikeCount;
  @JsonKey(name: 'max_reply_like_count')
  final String maxReplyLikeCount;
  @JsonKey(name: 'max_reply_dislike_count')
  final String maxReplyDislikeCount;
  final String status;
  @JsonKey(name: 'last_reply_user_id')
  final String lastReplyUserID;
  @JsonKey(name: 'max_reply')
  final String maxReply;
  @JsonKey(name: 'create_time')
  final int createTime;
  @JsonKey(name: 'last_reply_time')
  final int lastReplyTime;
  @JsonKey(name: 'total_page')
  final int totalPage;
  @JsonKey(name: 'is_adu')
  final bool isAdu;
  @JsonKey(name: 'is_hot')
  final bool isHot;
  @JsonKey(name: 'is_bookmarked')
  final bool isBookmarked;
  @JsonKey(name: 'is_replied')
  final bool isReplied;
  final Remark remark;
  final Category category;
  final User user;
}

@JsonSerializable()
class Category {
  Category({
    this.catId,
    this.name,
    this.postable,
    this.type,
    this.url,
    this.query,
    this.subCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @JsonKey(name: 'cat_id')
  final dynamic catId;
  final String name;
  final bool postable;
  final String type;
  final String url;
  final Map<String, String> query;
  @JsonKey(name: 'sub_category')
  final List<SubCategory> subCategory;
}

@JsonSerializable()
class SubCategory {
  SubCategory({
    this.catId,
    this.subCatId,
    this.name,
    this.postable,
    this.filterable,
    this.orderable,
    this.isFilter,
    this.url,
    this.query,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);

  @JsonKey(name: 'cat_id')
  final String catId;
  @JsonKey(name: 'sub_cat_id')
  final dynamic subCatId;
  final String name;
  final bool postable;
  final bool filterable;
  final bool orderable;
  @JsonKey(name: 'is_filter')
  final bool isFilter;
  final String url;
  final Map<String, String> query;
}

@JsonSerializable()
class FixedCategory {
  FixedCategory({
    this.name,
    this.catList,
  });

  factory FixedCategory.fromJson(Map<String, dynamic> json) =>
      _$FixedCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$FixedCategoryToJson(this);

  final String name;
  @JsonKey(name: 'cat_list')
  final List<Category> catList;
}

@JsonSerializable()
class User {
  User({
    this.userID,
    this.nickname,
    this.email,
    this.level,
    this.gender,
    this.status,
    this.plusExpiryTime,
    this.createTime,
    this.lastLoginTime,
    this.levelName,
    this.isFollowing,
    this.isBlocked,
    this.isDisappear,
    this.isPlusUser,
    this.metaData,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'user_id')
  final String userID;
  final String nickname;
  final String email;
  final String level;
  final String gender;
  final String status;
  @JsonKey(name: 'plus_expiry_time')
  final int plusExpiryTime;
  @JsonKey(name: 'level_name')
  final String levelName;
  @JsonKey(name: 'create_time')
  final int createTime;
  @JsonKey(name: 'last_login_time')
  final int lastLoginTime;
  @JsonKey(name: 'is_following')
  final bool isFollowing;
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;
  @JsonKey(name: 'is_disappear')
  final bool isDisappear;
  @JsonKey(name: 'is_plus_user')
  final bool isPlusUser;
  @JsonKey(name: 'meta_data')
  final MetaData metaData;
}

@JsonSerializable()
class MetaData {
  MetaData({
    this.customCat,
    this.keywordFilter,
    this.loginCount,
    this.lastReadNotifyTime,
    this.notifyCount,
    this.pushSetting,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$MetaDataToJson(this);

  @JsonKey(name: 'custom_cat')
  final List<String> customCat;
  @JsonKey(name: 'keyword_filter')
  final String keywordFilter;
  @JsonKey(name: 'login_count')
  final int loginCount;
  @JsonKey(name: 'last_read_notify_time')
  final int lastReadNotifyTime;
  @JsonKey(name: 'notify_count')
  final int notifyCount;
  @JsonKey(name: 'push_setting')
  final PushSetting pushSetting;
}

@JsonSerializable()
class PushSetting {
  PushSetting({
    this.all,
    this.showPreview,
    this.newReply,
    this.quote,
    this.followingNewThread,
  });

  factory PushSetting.fromJson(Map<String, dynamic> json) =>
      _$PushSettingFromJson(json);
  Map<String, dynamic> toJson() => _$PushSettingToJson(this);

  final bool all;
  @JsonKey(name: 'show_preview')
  final bool showPreview;
  @JsonKey(name: 'new_reply')
  final bool newReply;
  final bool quote;
  @JsonKey(name: 'following_new_thread')
  final bool followingNewThread;
}

@JsonSerializable()
class Remark {
  Remark({
    this.lastReplyCount,
  });

  factory Remark.fromJson(Map<String, dynamic> json) => _$RemarkFromJson(json);
  Map<String, dynamic> toJson() => _$RemarkToJson(this);

  @JsonKey(name: 'last_reply_count')
  final int lastReplyCount;
}
