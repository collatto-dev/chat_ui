import 'package:chat_ui/chat_histories.dart';
import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/chat_ui.dart';
import 'package:chat_ui/model/chat_history_model.dart';

class Stub {
  // test
  static FutureChatHistories getFutureChatHistories() {
    return FutureChatHistories(Future.value([
      const ChatHistoryModel(history: "1abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"),
      const ChatHistoryModel(history: "2abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"),
      const ChatHistoryModel(history: "3abc\ndef\nghijk", historyPosition: HistoryPosition.left,),
      const ChatHistoryModel(history: "4abc\ndef\nghijk", historyPosition: HistoryPosition.right),
      const ChatHistoryModel(history: "5abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"),
      const ChatHistoryModel(history: "6abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"),
      const ChatHistoryModel(history: "5abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"),
      const ChatHistoryModel(history: "6abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"),
      const ChatHistoryModel(history: "7abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: ""),
      const ChatHistoryModel(history: "8abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: ""),
      const ChatHistoryModel(history: "9abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"),
      const ChatHistoryModel(history: "10abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"),
    ]));
  }

  static List<ChatHistoryModel> getChatHistoryModels() {
    List<ChatHistoryModel> chatHistoryModels = [];
    chatHistoryModels.add(ChatHistoryModel(history: "1abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"));
    chatHistoryModels.add(ChatHistoryModel(history: "2abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"));
    chatHistoryModels.add(ChatHistoryModel(history: "3abc\ndef\nghijk", historyPosition: HistoryPosition.left,));
    chatHistoryModels.add(ChatHistoryModel(history: "4abc\ndef\nghijk", historyPosition: HistoryPosition.right));
    chatHistoryModels.add(ChatHistoryModel(history: "5abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"));
    chatHistoryModels.add(ChatHistoryModel(history: "6abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"));
    chatHistoryModels.add(ChatHistoryModel(history: "5abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"));
    chatHistoryModels.add(ChatHistoryModel(history: "6abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"));
    chatHistoryModels.add(ChatHistoryModel(history: "7abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: ""));
    chatHistoryModels.add(ChatHistoryModel(history: "8abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: ""));
    chatHistoryModels.add(ChatHistoryModel(history: "9abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"));
    chatHistoryModels.add(ChatHistoryModel(history: "10abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"));
    return chatHistoryModels;
  }

  // static FutureChatHistories getFutureChatHistoriesFromStr() {
  //   return Future.value(ChatHistories.convertToChatHistories([
  //     "abc\ndef\nghijk"]
  //   ));
  //     "abc\ndef\nghijk", historyType: HistoryType.partner,),
  //     "abc\ndef\nghijk", historyType: HistoryType.user),
  //     const ChatHistory("abc\ndef\nghijk", historyType: HistoryType.partner,),
  //     const ChatHistory("abc\ndef\nghijk", historyType: HistoryType.user),
  //     const ChatHistory("abc\ndef\nghijk", historyType: HistoryType.partner,),
  //     const ChatHistory("abc\ndef\nghijk", historyType: HistoryType.user),
  //     const ChatHistory("abc\ndef\nghijk", historyType: HistoryType.partner,),
  //     const ChatHistory("abc\ndef\nghijk", historyType: HistoryType.user),
  //     const ChatHistory("abc\ndef\nghijk", historyType: HistoryType.partner,),
  //     const ChatHistory("abc\ndef\nghijk", historyType: HistoryType.user),
  //   ]));
  // }
}