import 'package:chat_ui/model/user_data.dart';

class ChatHistoryModel {

  const ChatHistoryModel({
    this.history,
    this.userData,
    this.timestamp
  });
  static const String _keyHistory = "history";
  static const String _keyUserData = "user_data";
  static const String _keyTimestamp = "timestamp";

  final String? history;
  final UserData? userData;
  final DateTime? timestamp;

  factory ChatHistoryModel.fromJson(Map<String, dynamic> json) {
    print("ask_log: UserData.fromJson(json): ${UserData.fromJson(json).userName}");
    return ChatHistoryModel(
      history: json[_keyHistory],
      userData: UserData.fromJson(json[_keyUserData]),
      timestamp: _toDateTime(json)
    );
  }

  Map<String, dynamic> toJson() => {
    _keyHistory: history,
    _keyUserData: userData?.toJson(),
    _keyTimestamp: timestamp?.toString()
  };

  static DateTime? _toDateTime(Map<String, dynamic>? json) {
    final dateTimeStr = json?[_keyTimestamp];
    if (dateTimeStr == null) {
      return null;
    }
    try {
      return DateTime.parse(dateTimeStr);
    } catch (e) {
      print(e);
      return null;
    }
  }

  String toString() {
    return "$_keyHistory: $history "
        "$_keyUserData: $userData, $_keyTimestamp: $timestamp";
  }

  String? getTimeStampStr() {
    if (timestamp == null) return null;
    timestamp!.toString();
  }
}
