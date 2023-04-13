import 'package:chat_ui/chat_histories.dart';
import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/chat_ui.dart';
import 'package:chat_ui/model/chat_history_model.dart';

class Stub {
  // test
  static FutureChatHistories getFutureChatHistories() {
    return FutureChatHistories(Future.value([
      const ChatHistoryModel(history: "1abc\ndef\nghijk", historyType: HistoryType.partner, name: "ai"),
      const ChatHistoryModel(history: "2abc\ndef\nghijk", historyType: HistoryType.user, name: "ask"),
      const ChatHistoryModel(history: "3abc\ndef\nghijk", historyType: HistoryType.partner,),
      const ChatHistoryModel(history: "4abc\ndef\nghijk", historyType: HistoryType.user),
      const ChatHistoryModel(history: "5abc\ndef\nghijk", historyType: HistoryType.partner, name: "ai"),
      const ChatHistoryModel(history: "6abc\ndef\nghijk", historyType: HistoryType.user, name: "ask"),
      const ChatHistoryModel(history: "7abc\ndef\nghijk", historyType: HistoryType.partner,),
      const ChatHistoryModel(history: "8abc\ndef\nghijk", historyType: HistoryType.user),
      const ChatHistoryModel(history: "9abc\ndef\nghijk", historyType: HistoryType.partner, name: "ai"),
      const ChatHistoryModel(history: "10abc\ndef\nghijk", historyType: HistoryType.user, name: "ask"),
    ]));
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