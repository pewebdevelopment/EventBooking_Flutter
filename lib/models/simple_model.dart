class SimpleMode{
  int? id;
  String? name;
  bool? isSelected;
  dynamic value;
  SimpleMode({this.id,this.name,this.isSelected,this.value});
}

class DateMode{
  int? id;
  String? name;
  bool? isSelected;
  DateMode({this.id,this.name,this.isSelected});
}

class EventCardModel{
  final String title;
  final String image;
  EventCardModel({required this.title,required this.image});
}

class VideosLiveModel{
  final String personName;
  final String category;
  final String image;
  final String personImage;
  final String liveTotal;
  VideosLiveModel({required this.personName,required this.category,required this.image,required this.personImage,required this.liveTotal});
}

class VideosHighlitesModel{
  final String personName;
  final String category;
  final String image;
  final String personImage;
  final String liveTotal;
  final String time;
  VideosHighlitesModel({required this.personName,required this.category,required this.image,required this.personImage,required this.liveTotal,required this.time});
}

class CommentsModel{
  final int id;
  final String personName;
  final String commentsText;
  final String image;
  bool fav;
  bool isShow;
  final String time;
  final int totalComments;
  final List<SubCommentsModel> subCommentsModel;
  CommentsModel({
    required this.id,
    required this.personName,
    required this.commentsText,
    required this.image,
    required this.fav,
    required this.isShow,
    required this.time,
    required this.totalComments,
    required this.subCommentsModel,
  });
}

class SubCommentsModel{
  final String personName;
  final String commentsText;
  final String image;
  final bool fav;
  bool isShow;
  final String time;
  final int totalComments;
  SubCommentsModel({
    required this.personName,
    required this.commentsText,
    required this.image,
    required this.fav,
    required this.isShow,
    required this.time,
    required this.totalComments,
  });
}

class MessageModel{
  final String personName;
  final String message;
  final String image;
  final String time;
  final int totalMessage;
  int id;
  MessageModel({
    required this.personName,
    required this.message,
    required this.image,
    required this.time,
    required this.totalMessage,
    required this.id,
  });
}

class ChatListModel{
  final String date;
  int id;
  final List<ChatModel> chatModel;

  ChatListModel({
    required this.date,
    required this.id,
    required this.chatModel,
  });
}

class ChatModel{
  final String date;
  final String message;
  final String time;
  int id;
  int isSender;
  int isReceive;
  int daysDifference;
  int isSelect;
  ChatModel({
    required this.date,
    required this.message,
    required this.time,
    required this.id,
    required this.isSender,
    required this.isReceive,
    required this.daysDifference,
    required this.isSelect,
  });
}

class LanguageModel{
  final String laung;
  int id;

  LanguageModel({
    required this.laung,
    required this.id,
  });
}