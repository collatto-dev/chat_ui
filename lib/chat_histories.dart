import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_history_options.dart';
import 'package:flutter/cupertino.dart';

class ChatHistories extends StatefulWidget {

  const ChatHistories(this.chatHistoryModels, {
    this.leftHistoryOptions,
    this.rightHistoryOptions,
    this.initialScrollOffset, Key? key}) : super(key: key);

  final List<ChatHistoryModel> chatHistoryModels;
  final ChatHistoryOptions? leftHistoryOptions;
  final ChatHistoryOptions? rightHistoryOptions;
  final double? initialScrollOffset;

  @override
  State<StatefulWidget> createState() => _ChatHistoriesState();
}

class _ChatHistoriesState extends State<ChatHistories> {

  @override
  Widget build(BuildContext context) {
    debugPrint("ChatHistories build");
    // TODO: 後から履歴を追加しても、スクロール位置は維持する必用がある。
    final scrollController = ScrollController(
        initialScrollOffset: 100,
        keepScrollOffset: true);
    // debugPrint("scrollController.position.pixels: ${scrollController.position.pixels}");
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
    for (ChatHistoryModel chatHistoryModel in widget.chatHistoryModels) {
      if (chatHistoryModel.historyPosition == HistoryPosition.left) {
        chatHistories.add(ChatHistory(chatHistoryModel,
            historyOptions: widget.leftHistoryOptions ?? ChatHistoryOptions()));
      } else {
        chatHistories.add(ChatHistory(chatHistoryModel,
            historyOptions: widget.rightHistoryOptions ?? ChatHistoryOptions()));
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

// class ChatHistories extends StatelessWidget {
//
//   const ChatHistories(this.chatHistoryModels, {
//     this.partnerHistoryOption,
//     this.userHistoryOption,
//     this.initialScrollOffset, Key? key}) : super(key: key);
//
//   final List<ChatHistoryModel> chatHistoryModels;
//   final HistoryOption? partnerHistoryOption;
//   final HistoryOption? userHistoryOption;
//   final double? initialScrollOffset;
//
//   @override
//   Widget build(BuildContext context) {
//     debugPrint("ChatHistories build");
//     // TODO: 後から履歴を追加しても、スクロール位置は維持する必用がある。
//     final scrollController = ScrollController(initialScrollOffset: 100);
//     // debugPrint("scrollController.position.pixels: ${scrollController.position.pixels}");
//     // scrollController.attach(ScrollPosition())
//     return Container(
//         padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//       child: SingleChildScrollView(
//         reverse: true,
//         controller: scrollController,
//         child: Column(children: _createChatHistories()),
//       ),
//     );
//   }
//
//   List<ChatHistory> _createChatHistories() {
//     List<ChatHistory> chatHistories = [];
//     for (ChatHistoryModel chatHistoryModel in chatHistoryModels) {
//       if (chatHistoryModel.historyType == HistoryPosition.left) {
//         chatHistories.add(ChatHistory(chatHistoryModel,
//             historyOption: partnerHistoryOption ?? HistoryOption()));
//       } else {
//         chatHistories.add(ChatHistory(chatHistoryModel,
//             historyOption: userHistoryOption ?? HistoryOption()));
//       }
//     }
//     return chatHistories;
//   }
//
//   // static ChatHistories convertToChatHistories(List<String> historiesStr) {
//   //   List<ChatHistory> chatHistoriesElement = [];
//   //   for (var historyStr in historiesStr) {
//   //     chatHistoriesElement.add(ChatHistory(historyStr));
//   //   }
//   //   return ChatHistories(chatHistoriesElement);
//   // }
// }