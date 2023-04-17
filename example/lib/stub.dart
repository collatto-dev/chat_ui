import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/chat_ui.dart';
import 'package:chat_ui/model/chat_history_model.dart';

class Stub {

  static List<ChatHistoryModel> getChatHistoryModels() {
    List<ChatHistoryModel> chatHistoryModels = [];
    chatHistoryModels.add(ChatHistoryModel(history: "1abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "partner"));
    chatHistoryModels.add(ChatHistoryModel(history: "2abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "test_user"));
    chatHistoryModels.add(ChatHistoryModel(history: "3abc\ndef\nghijk", historyPosition: HistoryPosition.left,));
    chatHistoryModels.add(ChatHistoryModel(history: "4abc\ndef\nghijk", historyPosition: HistoryPosition.right));
    chatHistoryModels.add(ChatHistoryModel(history: "5abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "partner"));
    chatHistoryModels.add(ChatHistoryModel(history: "6abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "test_user"));
    chatHistoryModels.add(ChatHistoryModel(history: "5abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "partner"));
    chatHistoryModels.add(ChatHistoryModel(history: "6abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "test_user"));
    chatHistoryModels.add(ChatHistoryModel(history: "7abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: ""));
    chatHistoryModels.add(ChatHistoryModel(history: "8abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: ""));
    chatHistoryModels.add(ChatHistoryModel(history: "9abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "partner"));
    chatHistoryModels.add(ChatHistoryModel(history: "10abc\ndef\nghik", historyPosition: HistoryPosition.right, name: "test_user"));
    return chatHistoryModels;
  }

  static FutureChatHistories getFutureChatHistories() {
    return FutureChatHistories(Future.value([
      const ChatHistoryModel(history: "1abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "partner"),
      const ChatHistoryModel(history: "2abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "test_user"),
      const ChatHistoryModel(history: "3abc\ndef\nghijk", historyPosition: HistoryPosition.left,),
      const ChatHistoryModel(history: "4abc\ndef\nghijk", historyPosition: HistoryPosition.right),
      const ChatHistoryModel(history: "5abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "partner"),
      const ChatHistoryModel(history: "6abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "test_user"),
      const ChatHistoryModel(history: "5abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"),
      const ChatHistoryModel(history: "6abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"),
      const ChatHistoryModel(history: "7abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: ""),
      const ChatHistoryModel(history: "8abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: ""),
      const ChatHistoryModel(history: "9abc\ndef\nghijk", historyPosition: HistoryPosition.left, name: "ai"),
      const ChatHistoryModel(history: "10abc\ndef\nghijk", historyPosition: HistoryPosition.right, name: "ask"),
    ]));
  }
}