import 'package:chat_ui/chat_history.dart';

class ChatHistoryModel {

  const ChatHistoryModel({
    this.history,
    this.historyPosition,
    this.name,
    this.datetime
  });

  static const String _keyHistory = "history";
  static const String _keyHistoryPosition = "history_position";
  static const String _keyName = "name";
  static const String _keyDatetime = "datetime";

  final String? history;
  final HistoryPosition? historyPosition;
  final String? name;
  final String? datetime;

  factory ChatHistoryModel.fromJson(Map<String, dynamic> json) {
    return ChatHistoryModel(
      history: json[_keyHistory],
      historyPosition: json[_keyHistoryPosition],
      name: json[_keyName],
      datetime: json[_keyDatetime]
    );
  }

  Map<String, dynamic> toJson() => {
    _keyHistory: history,
    _keyHistoryPosition: historyPosition,
    _keyName: name,
    _keyDatetime: datetime
  };

  String toString() {
    return "history: $history, historyPosition: $historyPosition, name: $name, datetime: $datetime";
  }
}
