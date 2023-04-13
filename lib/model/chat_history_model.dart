import 'dart:ui';

import 'package:chat_ui/chat_history.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ChatHistoryModel {

  const ChatHistoryModel({
    this.history,
    this.historyType,
    this.name
  });

  final String? history;
  final HistoryType? historyType;
  final String? name;

  // factory ChatHistoryModel.fromJson() => _$ChatHistoryModelFromJson(json);
  // Map<String, dynamic> toJson => _$ChatHistoryModelToJson(this);
  //
  // ChatHistoryModel _$ChatHistoryModelFromJson => ChatHistoryModel();
  // Map<String, dynamic> _$ChatHistoryModelToJson(ChatHistoryModel instance) => <String dynamic> {
  //
  // };
}
