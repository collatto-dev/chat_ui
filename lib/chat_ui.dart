library chat_ui;

import 'package:chat_ui/change_notifier/chat_histories_notifier.dart';
import 'package:chat_ui/chat_field.dart';
import 'package:chat_ui/chat_histories.dart';
import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_history_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/room_data.dart';

class ChatUi extends StatelessWidget {

  const ChatUi(this.chatHistoryModels, {
    this.roomData,
    this.futureChatHistories,
    this.futureSendProcess,
    this.leftHistoryOptions,
    this.rightHistoryOptions,
    this.chatOption,
    Key? key
  }) : super(key: key);

  // ルームの情報(ルーム名、チャット内のメンバー一覧、自身の名前)
  final RoomData? roomData;
  final List<ChatHistoryModel> chatHistoryModels;
  final FutureChatHistories? futureChatHistories;

  // 送信ボタンを行いたい処理を、ここで実装する。
  // 例)サーバーへの送信、アプリ内保存などの非同期処理。
  // 戻り値として、画面に表示させたい履歴一覧を返す必用がある。
  final FutureSendProcess? futureSendProcess;
  final ChatHistoryOptions? leftHistoryOptions;
  final ChatHistoryOptions? rightHistoryOptions;
  final ChatHistoryOptions? chatOption;

  // final loadingIndicator;
  @override
  Widget build(BuildContext context) {
    // debugPrint("ChatUi build");
    return _unionChatHistoriesAndChatField(chatHistoryModels, context);
  }

  Widget _unionChatHistoriesAndChatField(List<ChatHistoryModel> chatHistories,
      BuildContext context) {
    // debugPrint("_unionChatHistoriesAndChatField");
    return ChangeNotifierProvider(
        create: (context) => ChatHistoriesNotifier(chatHistories),
        child: _ChatAndHistoryWidget(
          roomData: roomData,
          futureSendProcess: futureSendProcess,
          leftHistoryOptions: leftHistoryOptions,
          rightHistoryOptions: rightHistoryOptions,
          chatOption: chatOption,
        )
    );
  }
}

class _ChatAndHistoryWidget extends StatelessWidget {

  const _ChatAndHistoryWidget({
    this.roomData,
    this.futureSendProcess,
    this.leftHistoryOptions,
    this.rightHistoryOptions,
    this.chatOption,
    Key? key
  }) : super(key: key);

  // ルームの情報(ルーム名、チャット内のメンバー一覧、自身の名前)
  final RoomData? roomData;
  final FutureSendProcess? futureSendProcess;
  final ChatHistoryOptions? leftHistoryOptions;
  final ChatHistoryOptions? rightHistoryOptions;
  final ChatHistoryOptions? chatOption;

  @override
  Widget build(BuildContext context) {
    final chatHistoryNotifier = Provider.of<ChatHistoriesNotifier>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _createChatHistories(chatHistoryNotifier),
        _createChatField(chatHistoryNotifier),
      ],
    );
  }

  Widget _createChatHistories(ChatHistoriesNotifier chatHistoryNotifier) {
    return Consumer<ChatHistoriesNotifier>(
        builder: (context, messageNotifier, _) {
          return Expanded(
              child: ChatHistories(
                chatHistoryNotifier.getChatHistoryModels(),
                leftHistoryOptions: leftHistoryOptions,
                rightHistoryOptions: rightHistoryOptions,
              )
          );
        }
    );
  }

  Widget _createChatField(ChatHistoriesNotifier chatHistoryNotifier) {
    return ChatField(
      myName: roomData?.myName,
      chatOptions: chatOption,
      onPressedSendButton: (chatHistoryModel) async {
        // 送信ボタン押したら、Serverにデータ送信・内部保存など、行いたい動作はユーザーによって異なる。
        // よって処理は使用者に委ねて、画面更新に必要な履歴一覧をこちら側でもらう。
        if (futureSendProcess != null) {
          final chatHistoryModels = await futureSendProcess!(
              chatHistoryModel, chatHistoryNotifier.getChatHistoryModels());
          chatHistoryNotifier.updateChatHistoryModels(chatHistoryModels);
        }
      },
    );
  }
}

// 非同期処理を任せたいのならこちら。
//
// Deprecated ChatUiAsynchronousProcessing.
// Recommendation ChatUi.
//
@deprecated
class ChatUiAsynchronousProcessing extends StatelessWidget {
  const ChatUiAsynchronousProcessing(this.futureChatHistories, {
    this.roomData,
    this.futureSendProcess,
    this.leftHistoryOptions,
    this.rightHistoryOptions,
    this.chatOption,
    Key? key
  }) : super(key: key);

  final RoomData? roomData;
  final FutureChatHistories futureChatHistories;
  final FutureSendProcess? futureSendProcess;
  final ChatHistoryOptions? leftHistoryOptions;
  final ChatHistoryOptions? rightHistoryOptions;
  final ChatHistoryOptions? chatOption;

  // final loadingIndicator;
  @override
  Widget build(BuildContext context) {
    // debugPrint("ChatUi build");
    return FutureBuilder(
        future: futureChatHistories.futureHistoryModels,
        builder: (context, histories) {
          if (histories.hasData && histories.connectionState == ConnectionState.done) {
            return ChatUi(histories.data!,
                roomData: roomData,
                futureSendProcess: futureSendProcess,
                leftHistoryOptions: leftHistoryOptions,
                rightHistoryOptions: rightHistoryOptions,
                chatOption: chatOption);
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
}

class FutureChatHistories {
  FutureChatHistories(
      this.futureHistoryModels, {
        this.loading});
  final Future<List<ChatHistoryModel>> futureHistoryModels;
  final Widget? loading;
}

// 送信ボタンを行いたい処理を、ここで実装する。
// 戻り値として、画面に表示させたい履歴一覧を返す必用がある。
// ChatHistoryModel: 今回送信ボタンを押した際のデータ。
// List<ChatHistoryModel>: 過去の履歴データ。
typedef FutureSendProcess = Future<List<ChatHistoryModel>> Function(ChatHistoryModel, List<ChatHistoryModel>);