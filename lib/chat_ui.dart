library chat_ui;

import 'package:chat_ui/chat_field.dart';
import 'package:chat_ui/chat_histories.dart';
import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

// class ChatUi extends ConsumerWidget {
class ChatUi extends StatelessWidget {

  const ChatUi(this.futureChatHistories, {Key? key}) : super(key: key);

  // final List<String>? histories;
  // final BaseFutureChatHistories futureChatHistories;
  final FutureChatHistories futureChatHistories;

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final chatHistoryProvider = FutureProvider<List<ChatHistory>>((ref) async {
  //     return futureChatHistories.futureHistories;
  //   });
  //
  //   return ref.watch(chatHistoryProvider).when(
  //       data: (chatHistories) => _unionChatHistoriesAndChatField(chatHistories),
  //       error: (err, stack) => Text("Error: $err"),
  //       loading: () => const CircularProgressIndicator());
  // }
  @override
  Widget build(BuildContext context) {
    debugPrint("ChatUi build");
    return FutureBuilder(
        future: futureChatHistories.futureHistoryModels,
        builder: (context, histories) {
          if (histories.hasData && histories.connectionState == ConnectionState.done) {
            return _unionChatHistoriesAndChatField(histories.data!);
          } else {
            if (futureChatHistories.loading == null) {
              return const CircularProgressIndicator();
            } else {
              return futureChatHistories.loading!;
            }
          }
        }
    );
  }

  Column _unionChatHistoriesAndChatField(List<ChatHistoryModel> chatHistories) {
    debugPrint("_unionChatHistoriesAndChatField");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: ChatHistories(
              chatHistories,
              partnerHistoryOption: const HistoryOption(
                namePosition: NamePosition.bottom
                // fontSize: 30,
                // borderRadius: 40,
                // backgroundColor: Colors.blue,
                // historyPadding: EdgeInsets.all(80)
              ),
            )),
        const ChatField()
      ],
    );
  }

// Column _unionChatHistoriesAndChatField(List<ChatHistory> chatHistories) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Expanded(
  //           child: ChatHistories(chatHistories)),
  //       ChatField()
  //     ],
  //   );
  // }
}

// class FutureChatHistories extends BaseFutureChatHistories {
//   FutureChatHistories(
//       this.futureHistoryElements, {
//         this.loading});
//   final Future<List<ChatHistory>> futureHistoryElements;
//   final Widget? loading;
// }
class FutureChatHistories extends BaseFutureChatHistories {
  FutureChatHistories(
      this.futureHistoryModels, {
        this.loading});
  final Future<List<ChatHistoryModel>> futureHistoryModels;
  final Widget? loading;
}

class FutureChatHistoriesStr {
  FutureChatHistoriesStr(
      this.futureHistoriesStr, {
        this.loading});
  final Future<List<String>> futureHistoriesStr;
  final Widget? loading;
}

abstract class BaseFutureChatHistories {}