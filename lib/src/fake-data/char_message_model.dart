import 'dart:convert';

ChatMessageModel chatMessageModelFromJson(String str) =>
    ChatMessageModel.fromJson(json.decode(str));

String chatMessageModelToJson(ChatMessageModel data) =>
    json.encode(data.toJson());

class ChatMessageModel {
  int chatId;
  int to;
  int from;
  List<String> message;
  String chatType;
  bool toUserOnlineStatus;

  ChatMessageModel({
    this.chatId,
    this.to,
    this.from,
    this.message,
    this.chatType,
    this.toUserOnlineStatus,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        chatId: json["chat_id"],
        to: json["to"],
        from: json["from"],
        message: List<String>.from(json["message"].map((x) => x)),
        chatType: json["chat_type"],
        toUserOnlineStatus: json['to_user_online_status'],
      );

  Map<String, dynamic> toJson() => {
        "chat_id": chatId,
        "to": to,
        "from": from,
        "message": List<dynamic>.from(message.map((x) => x)),
        "chat_type": chatType,
      };
}
