// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lihkg_api_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) {
  return BaseResponse<T>(
      errorCode: json['error_code'] as int,
      errorMessage: json['error_message'] as String,
      serverTime: json['server_time'] as int,
      success: json['success'] as int,
      response:
          BaseResponse._dataFromJson(json['response'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BaseResponseToJson<T>(BaseResponse<T> instance) =>
    <String, dynamic>{
      'server_time': instance.serverTime,
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
      'success': instance.success,
      'response': BaseResponse._dataToJson(instance.response)
    };

PropertyResponse _$PropertyResponseFromJson(Map<String, dynamic> json) {
  return PropertyResponse(
      lihkg: json['lihkg'] as bool,
      categoryList: (json['category_list'] as List)
          ?.map((e) =>
              e == null ? null : Category.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      fixedCategoryList: (json['fixed_category_list'] as List)
          ?.map((e) => e == null
              ? null
              : FixedCategory.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      categoryOrder:
          (json['category_order'] as List)?.map((e) => e as String)?.toList(),
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>),
      config: json['config']);
}

Map<String, dynamic> _$PropertyResponseToJson(PropertyResponse instance) =>
    <String, dynamic>{
      'lihkg': instance.lihkg,
      'category_list': instance.categoryList,
      'fixed_category_list': instance.fixedCategoryList,
      'category_order': instance.categoryOrder,
      'me': instance.me,
      'config': instance.config
    };

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return CategoryResponse(
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isPagination: json['is_pagination'] as bool,
      items: (json['items'] as List)
          ?.map((e) =>
              e == null ? null : Item.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
      'is_pagination': instance.isPagination,
      'items': instance.items,
      'me': instance.me
    };

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) {
  return SearchResponse(
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isPagination: json['is_pagination'] as bool,
      items: (json['items'] as List)
          ?.map((e) =>
              e == null ? null : Item.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
      'is_pagination': instance.isPagination,
      'items': instance.items,
      'me': instance.me
    };

PageResponse _$PageResponseFromJson(Map<String, dynamic> json) {
  return PageResponse(
      threadID: json['thread_id'] as String,
      catID: json['cat_id'] as String,
      subCatID: json['sub_cat_id'] as String,
      title: json['title'] as String,
      userID: json['user_id'] as String,
      userNickname: json['user_nickname'] as String,
      userGender: json['user_gender'] as String,
      noOfReply: json['no_of_reply'] as String,
      noOfUniUserReply: json['no_of_uni_user_reply'] as String,
      likeCount: json['like_count'],
      dislikeCount: json['dislike_count'],
      replyLikeCount: json['reply_like_count'] as String,
      replyDislikeCount: json['reply_dislike_count'] as String,
      maxReplyLikeCount: json['max_reply_like_count'] as String,
      maxReplyDislikeCount: json['max_reply_dislike_count'] as String,
      createTime: json['create_time'] as int,
      lastReplyTime: json['last_reply_time'] as int,
      status: json['status'] as String,
      isAdu: json['is_adu'] as bool,
      remark: json['remark'] == null
          ? null
          : Remark.fromJson(json['remark'] as Map<String, dynamic>),
      lastReplyUserID: json['last_reply_user_id'] as String,
      maxReply: json['max_reply'] as String,
      totalPage: json['total_page'] as int,
      isHot: json['is_hot'] as bool,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isBookmarked: json['is_bookmarked'] as bool,
      isReplied: json['is_replied'] as bool,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      page: json['page'] as String,
      itemData: (json['item_data'] as List)
          ?.map((e) =>
              e == null ? null : ItemData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PageResponseToJson(PageResponse instance) =>
    <String, dynamic>{
      'thread_id': instance.threadID,
      'cat_id': instance.catID,
      'sub_cat_id': instance.subCatID,
      'title': instance.title,
      'user_id': instance.userID,
      'user_nickname': instance.userNickname,
      'user_gender': instance.userGender,
      'no_of_reply': instance.noOfReply,
      'no_of_uni_user_reply': instance.noOfUniUserReply,
      'like_count': instance.likeCount,
      'dislike_count': instance.dislikeCount,
      'reply_like_count': instance.replyLikeCount,
      'reply_dislike_count': instance.replyDislikeCount,
      'max_reply_like_count': instance.maxReplyLikeCount,
      'max_reply_dislike_count': instance.maxReplyDislikeCount,
      'status': instance.status,
      'last_reply_user_id': instance.lastReplyUserID,
      'max_reply': instance.maxReply,
      'page': instance.page,
      'create_time': instance.createTime,
      'last_reply_time': instance.lastReplyTime,
      'total_page': instance.totalPage,
      'is_adu': instance.isAdu,
      'is_hot': instance.isHot,
      'is_bookmarked': instance.isBookmarked,
      'is_replied': instance.isReplied,
      'remark': instance.remark,
      'category': instance.category,
      'user': instance.user,
      'item_data': instance.itemData,
      'me': instance.me
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
      token: json['token'] as String,
      keywordFilterList: json['keyword_filter_list'] as List,
      categoryOrder:
          (json['category_order'] as List)?.map((e) => e as String)?.toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      fixedCategoryList: (json['fixed_category_list'] as List)
          ?.map((e) => e == null
              ? null
              : FixedCategory.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'keyword_filter_list': instance.keywordFilterList,
      'category_order': instance.categoryOrder,
      'user': instance.user,
      'fixed_category_list': instance.fixedCategoryList,
      'me': instance.me
    };

LikeResponse _$LikeResponseFromJson(Map<String, dynamic> json) {
  return LikeResponse(
      isLike: json['is_like'] as bool,
      isUpvote: json['is_upvote'] as bool,
      thread: json['thread'] == null
          ? null
          : Item.fromJson(json['thread'] as Map<String, dynamic>),
      post: json['post'] == null
          ? null
          : ItemData.fromJson(json['post'] as Map<String, dynamic>),
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LikeResponseToJson(LikeResponse instance) =>
    <String, dynamic>{
      'is_like': instance.isLike,
      'is_upvote': instance.isUpvote,
      'thread': instance.thread,
      'post': instance.post,
      'me': instance.me
    };

ReplyResponse _$ReplyResponseFromJson(Map<String, dynamic> json) {
  return ReplyResponse(
      noOfReply: json['no_of_reply'] as int,
      threadID: json['thread_id'] as String,
      totalPage: json['total_page'] as int,
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ReplyResponseToJson(ReplyResponse instance) =>
    <String, dynamic>{
      'no_of_reply': instance.noOfReply,
      'thread_id': instance.threadID,
      'total_page': instance.totalPage,
      'me': instance.me
    };

CreateResponse _$CreateResponseFromJson(Map<String, dynamic> json) {
  return CreateResponse(
      threadID: json['thread_id'] as String,
      me: json['me'] == null
          ? null
          : User.fromJson(json['me'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CreateResponseToJson(CreateResponse instance) =>
    <String, dynamic>{'thread_id': instance.threadID, 'me': instance.me};

ItemData _$ItemDataFromJson(Map<String, dynamic> json) {
  return ItemData(
      postID: json['post_id'] as String,
      quotePostID: json['quote_post_id'] as String,
      threadID: json['thread_id'] as String,
      userNickname: json['user_nickname'] as String,
      userGender: json['user_gender'] as String,
      likeCount: json['like_count'],
      dislikeCount: json['dislike_count'],
      voteScore: json['vote_score'] as String,
      noOfQuote: json['no_of_quote'] as String,
      status: json['status'],
      replyTime: json['reply_time'] as int,
      msgNum: json['msg_num'] as String,
      msg: json['msg'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      page: json['page'] as int,
      quote: json['quote'] == null
          ? null
          : ItemData.fromJson(json['quote'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'post_id': instance.postID,
      'quote_post_id': instance.quotePostID,
      'thread_id': instance.threadID,
      'user_nickname': instance.userNickname,
      'user_gender': instance.userGender,
      'like_count': instance.likeCount,
      'dislike_count': instance.dislikeCount,
      'vote_score': instance.voteScore,
      'no_of_quote': instance.noOfQuote,
      'msg_num': instance.msgNum,
      'msg': instance.msg,
      'reply_time': instance.replyTime,
      'page': instance.page,
      'status': instance.status,
      'user': instance.user,
      'quote': instance.quote
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      threadID: json['thread_id'] as String,
      catID: json['cat_id'] as String,
      subCatID: json['sub_cat_id'] as String,
      title: json['title'] as String,
      userID: json['user_id'] as String,
      userNickname: json['user_nickname'] as String,
      userGender: json['user_gender'] as String,
      noOfReply: json['no_of_reply'] as String,
      noOfUniUserReply: json['no_of_uni_user_reply'] as String,
      likeCount: json['like_count'],
      dislikeCount: json['dislike_count'],
      replyLikeCount: json['reply_like_count'] as String,
      replyDislikeCount: json['reply_dislike_count'] as String,
      maxReplyLikeCount: json['max_reply_like_count'] as String,
      maxReplyDislikeCount: json['max_reply_dislike_count'] as String,
      createTime: json['create_time'] as int,
      lastReplyTime: json['last_reply_time'] as int,
      status: json['status'] as String,
      isAdu: json['is_adu'] as bool,
      remark: json['remark'] == null
          ? null
          : Remark.fromJson(json['remark'] as Map<String, dynamic>),
      lastReplyUserID: json['last_reply_user_id'] as String,
      maxReply: json['max_reply'] as String,
      totalPage: json['total_page'] as int,
      isHot: json['is_hot'] as bool,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      isBookmarked: json['is_bookmarked'] as bool,
      isReplied: json['is_replied'] as bool,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'thread_id': instance.threadID,
      'cat_id': instance.catID,
      'sub_cat_id': instance.subCatID,
      'title': instance.title,
      'user_id': instance.userID,
      'user_nickname': instance.userNickname,
      'user_gender': instance.userGender,
      'no_of_reply': instance.noOfReply,
      'no_of_uni_user_reply': instance.noOfUniUserReply,
      'like_count': instance.likeCount,
      'dislike_count': instance.dislikeCount,
      'reply_like_count': instance.replyLikeCount,
      'reply_dislike_count': instance.replyDislikeCount,
      'max_reply_like_count': instance.maxReplyLikeCount,
      'max_reply_dislike_count': instance.maxReplyDislikeCount,
      'status': instance.status,
      'last_reply_user_id': instance.lastReplyUserID,
      'max_reply': instance.maxReply,
      'create_time': instance.createTime,
      'last_reply_time': instance.lastReplyTime,
      'total_page': instance.totalPage,
      'is_adu': instance.isAdu,
      'is_hot': instance.isHot,
      'is_bookmarked': instance.isBookmarked,
      'is_replied': instance.isReplied,
      'remark': instance.remark,
      'category': instance.category,
      'user': instance.user
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
      catId: json['cat_id'],
      name: json['name'] as String,
      postable: json['postable'] as bool,
      type: json['type'] as String,
      url: json['url'] as String,
      query: (json['query'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      subCategory: (json['sub_category'] as List)
          ?.map((e) => e == null
              ? null
              : SubCategory.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'cat_id': instance.catId,
      'name': instance.name,
      'postable': instance.postable,
      'type': instance.type,
      'url': instance.url,
      'query': instance.query,
      'sub_category': instance.subCategory
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) {
  return SubCategory(
      catId: json['cat_id'] as String,
      subCatId: json['sub_cat_id'],
      name: json['name'] as String,
      postable: json['postable'] as bool,
      filterable: json['filterable'] as bool,
      orderable: json['orderable'] as bool,
      isFilter: json['is_filter'] as bool,
      url: json['url'] as String,
      query: (json['query'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(k, e as String),
      ));
}

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'cat_id': instance.catId,
      'sub_cat_id': instance.subCatId,
      'name': instance.name,
      'postable': instance.postable,
      'filterable': instance.filterable,
      'orderable': instance.orderable,
      'is_filter': instance.isFilter,
      'url': instance.url,
      'query': instance.query
    };

FixedCategory _$FixedCategoryFromJson(Map<String, dynamic> json) {
  return FixedCategory(
      name: json['name'] as String,
      catList: (json['cat_list'] as List)
          ?.map((e) =>
              e == null ? null : Category.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FixedCategoryToJson(FixedCategory instance) =>
    <String, dynamic>{'name': instance.name, 'cat_list': instance.catList};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      userID: json['user_id'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      level: json['level'] as String,
      gender: json['gender'] as String,
      status: json['status'] as String,
      plusExpiryTime: json['plus_expiry_time'] as int,
      createTime: json['create_time'] as int,
      lastLoginTime: json['last_login_time'] as int,
      levelName: json['level_name'] as String,
      isFollowing: json['is_following'] as bool,
      isBlocked: json['is_blocked'] as bool,
      isDisappear: json['is_disappear'] as bool,
      isPlusUser: json['is_plus_user'] as bool,
      metaData: json['meta_data'] == null
          ? null
          : MetaData.fromJson(json['meta_data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userID,
      'nickname': instance.nickname,
      'email': instance.email,
      'level': instance.level,
      'gender': instance.gender,
      'status': instance.status,
      'plus_expiry_time': instance.plusExpiryTime,
      'level_name': instance.levelName,
      'create_time': instance.createTime,
      'last_login_time': instance.lastLoginTime,
      'is_following': instance.isFollowing,
      'is_blocked': instance.isBlocked,
      'is_disappear': instance.isDisappear,
      'is_plus_user': instance.isPlusUser,
      'meta_data': instance.metaData
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) {
  return MetaData(
      customCat:
          (json['custom_cat'] as List)?.map((e) => e as String)?.toList(),
      keywordFilter: json['keyword_filter'] as String,
      loginCount: json['login_count'] as int,
      lastReadNotifyTime: json['last_read_notify_time'] as int,
      notifyCount: json['notify_count'] as int,
      pushSetting: json['push_setting'] == null
          ? null
          : PushSetting.fromJson(json['push_setting'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'custom_cat': instance.customCat,
      'keyword_filter': instance.keywordFilter,
      'login_count': instance.loginCount,
      'last_read_notify_time': instance.lastReadNotifyTime,
      'notify_count': instance.notifyCount,
      'push_setting': instance.pushSetting
    };

PushSetting _$PushSettingFromJson(Map<String, dynamic> json) {
  return PushSetting(
      all: json['all'] as bool,
      showPreview: json['show_preview'] as bool,
      newReply: json['new_reply'] as bool,
      quote: json['quote'] as bool,
      followingNewThread: json['following_new_thread'] as bool);
}

Map<String, dynamic> _$PushSettingToJson(PushSetting instance) =>
    <String, dynamic>{
      'all': instance.all,
      'show_preview': instance.showPreview,
      'new_reply': instance.newReply,
      'quote': instance.quote,
      'following_new_thread': instance.followingNewThread
    };

Remark _$RemarkFromJson(Map<String, dynamic> json) {
  return Remark(lastReplyCount: json['last_reply_count'] as int);
}

Map<String, dynamic> _$RemarkToJson(Remark instance) =>
    <String, dynamic>{'last_reply_count': instance.lastReplyCount};
