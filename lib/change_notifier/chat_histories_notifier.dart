import 'package:chat_ui/model/chat_history_model.dart';
import 'package:flutter/material.dart';

class ChatHistoriesNotifier extends ChangeNotifier {

  List<ChatHistoryModel> _chatHistoryModels = [];

  ChatHistoriesNotifier(this._chatHistoryModels);

  void addChatHistoryModels(ChatHistoryModel chatHistoryModel) {
    _chatHistoryModels.add(chatHistoryModel);
    // debugPrint("chatHistoryModel: $chatHistoryModel");
    notifyListeners();
  }

  void updateChatHistoryModels(List<ChatHistoryModel> chatHistoryModels) {
    _chatHistoryModels = chatHistoryModels;
    // debug(chatHistoryModels);
    // debugPrint("updateChatHistoryModels: $chatHistoryModels");
    notifyListeners();
  }

  List<ChatHistoryModel> getChatHistoryModels() {
    return _chatHistoryModels;
  }

  void debug(List<ChatHistoryModel> chatHistoryModels) {
    for (ChatHistoryModel chatHistoryModel in chatHistoryModels) {
      print("debug chatHistoryModel: ${chatHistoryModel.toString()}");
    }
  }

}