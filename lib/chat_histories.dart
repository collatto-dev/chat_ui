import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_option.dart';
import 'package:flutter/cupertino.dart';

class ChatHistories extends StatelessWidget {

  const ChatHistories(this.chatHistoryModels, {
    this.partnerHistoryOption,
    this.userHistoryOption,
    this.initialScrollOffset, Key? key}) : super(key: key);

  final List<ChatHistoryModel> chatHistoryModels;
  final HistoryOption? partnerHistoryOption;
  final HistoryOption? userHistoryOption;
  final double? initialScrollOffset;

  @override
  Widget build(BuildContext context) {
    debugPrint("ChatHistories build");
    final scrollController = ScrollController(initialScrollOffset: 100);
    // scrollController.attach(ScrollPosition())
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: SingleChildScrollView(
        reverse: true,
        controller: scrollController,
        child: Column(children: _createChatHistories()),
      ),
    );
  }

  List<ChatHistory> _createChatHistories() {
    List<ChatHistory> chatHistories = [];
    for (ChatHistoryModel chatHistoryModel in chatHistoryModels) {
      if (chatHistoryModel.historyType == HistoryType.partner) {
        chatHistories.add(ChatHistory(chatHistoryModel, historyOption: partnerHistoryOption));
      } else {
        chatHistories.add(ChatHistory(chatHistoryModel, historyOption: userHistoryOption));
      }
    }
    return chatHistories;
  }

  // static ChatHistories convertToChatHistories(List<String> historiesStr) {
  //   List<ChatHistory> chatHistoriesElement = [];
  //   for (var historyStr in historiesStr) {
  //     chatHistoriesElement.add(ChatHistory(historyStr));
  //   }
  //   return ChatHistories(chatHistoriesElement);
  // }
}