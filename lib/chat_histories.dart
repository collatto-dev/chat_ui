import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_history_options.dart';
import 'package:chat_ui/model/user_data.dart';
import 'package:flutter/material.dart';

class ChatHistories extends StatefulWidget {

  const ChatHistories(this.chatHistoryModels, {
    this.myUserData,
    this.leftHistoryOptions,
    this.rightHistoryOptions,
    this.initialScrollOffset, Key? key}) : super(key: key);

  final List<ChatHistoryModel> chatHistoryModels;
  final UserData? myUserData;
  final ChatHistoryOptions? leftHistoryOptions;
  final ChatHistoryOptions? rightHistoryOptions;
  final double? initialScrollOffset;

  @override
  State<StatefulWidget> createState() => _ChatHistoriesState();
}

class _ChatHistoriesState extends State<ChatHistories> {

  @override
  Widget build(BuildContext context) {
    // TODO: 後から履歴を追加しても、スクロール位置は維持する必用がある。
    final scrollController = ScrollController();
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
    for (ChatHistoryModel chatHistoryModel in widget.chatHistoryModels) {
      if (chatHistoryModel?.userData?.userId == widget.myUserData?.userId) {
        chatHistories.add(ChatHistory(chatHistoryModel,
            historyPosition: HistoryPosition.right,
            historyOptions: widget.rightHistoryOptions ?? ChatHistoryOptions()));
      } else {
        chatHistories.add(ChatHistory(chatHistoryModel,
            historyPosition: HistoryPosition.left,
            historyOptions: widget.leftHistoryOptions ?? ChatHistoryOptions()));
      }
    }
    return chatHistories;
  }
}
