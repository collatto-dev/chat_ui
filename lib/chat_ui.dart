library chat_ui;

import 'package:chat_ui/change_notifier/chat_histories_notifier.dart';
import 'package:chat_ui/chat_field.dart';
import 'package:chat_ui/chat_histories.dart';
import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_history_options.dart';
import 'package:chat_ui/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/room_data.dart';

class ChatUi extends StatelessWidget {

  const ChatUi(this.chatHistoryModels, {
    this.myUserData,
    this.futureChatHistories,
    this.futureSendProcess,
    this.leftHistoryOptions,
    this.rightHistoryOptions,
    this.chatOption,
    this.allowSendingOfEmptyCharacters = false,
    Key? key
  }) : super(key: key);

  // ルームの情報(ルーム名、チャット内のメンバー一覧、自身の名前)
  final UserData? myUserData;
  final List<ChatHistoryModel> chatHistoryModels;
  final FutureChatHistories? futureChatHistories;

  // 送信ボタンを行いたい処理を、ここで実装する。
  // 例)サーバーへの送信、アプリ内保存などの非同期処理。
  // 戻り値として、画面に表示させたい履歴一覧を返す必用がある。
  final FutureSendProcess? futureSendProcess;
  final ChatHistoryOptions? leftHistoryOptions;
  final ChatHistoryOptions? rightHistoryOptions;
  final ChatHistoryOptions? chatOption;
  // 空文字を送信するとチャット欄が荒れるため、空文字を送信対象にするかどうかはここで設定する
  final bool allowSendingOfEmptyCharacters;

  @override
  Widget build(BuildContext context) {
    // debugPrint("ChatUi build");
    return _unionChatHistoriesAndChatField(chatHistoryModels, context);
  }

  Widget _unionChatHistoriesAndChatField(List<ChatHistoryModel> chatHistories,
      BuildContext context) {
    // debugPrint("_unionChatHistoriesAndChatField");
    // List<ChatHistoryModel>packageUserChatAndHistoryModels =
    return ChangeNotifierProvider(
        create: (context) => ChatHistoriesNotifier(chatHistories),
        child: _ChatAndHistoryWidget(
          [...chatHistoryModels],
          myUserData: myUserData,
          futureSendProcess: futureSendProcess,
          leftHistoryOptions: leftHistoryOptions,
          rightHistoryOptions: rightHistoryOptions,
          chatOption: chatOption,
          allowSendingOfEmptyCharacters: allowSendingOfEmptyCharacters,
        )
    );
  }
}

class _ChatAndHistoryWidget extends StatelessWidget {

  const _ChatAndHistoryWidget(this.packageUserChatAndHistoryModels, {
    this.myUserData,
    this.futureSendProcess,
    this.leftHistoryOptions,
    this.rightHistoryOptions,
    this.chatOption,
    this.allowSendingOfEmptyCharacters = false,
    Key? key
  }) : super(key: key);

  // ルームの情報(ルーム名、チャット内のメンバー一覧、自身の名前)
  final List<ChatHistoryModel> packageUserChatAndHistoryModels;
  final UserData? myUserData;
  final FutureSendProcess? futureSendProcess;
  final ChatHistoryOptions? leftHistoryOptions;
  final ChatHistoryOptions? rightHistoryOptions;
  final ChatHistoryOptions? chatOption;
  final bool allowSendingOfEmptyCharacters;

  @override
  Widget build(BuildContext context) {
    final chatHistoryNotifier = Provider.of<ChatHistoriesNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // chat_uiのパッケージ呼び出し元で、非同期処理によりChatHistoryModelsを追加して再Buildした場合、
      // chatHistoryNotifierの値は変更されず、パッケージ呼び出し元のChatHistoryModelsだけが更新される。
      // そのため、chatHistoryNotifierの値と、パッケージ呼び出し元のChatHistoryModelsに差異が生じる。
      // WidgetのBuild中にchatHistoryNotifierを更新することは出来ないため、
      // Build完了後に、chatHistoryNotifierの値と、パッケージ呼び出し元のChatHistoryModelsのデータが
      // 同一になるように、chatHistoryNotifierを更新し、画面の表示を反映させる。
      print("_ChatAndHistoryWidgetState addPostFrameCallback");
      if (packageUserChatAndHistoryModels.length != chatHistoryNotifier.getChatHistoryModels().length) {
        print("tmpChatAndHistoryModels update");
        chatHistoryNotifier.updateChatHistoryModels(packageUserChatAndHistoryModels);
      }
    });
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
                myUserData: myUserData,
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
      myUserData: myUserData,
      chatOptions: chatOption,
      onPressedSendButton: (chatHistoryModel) async {
        // 送信ボタン押したら、Serverにデータ送信・内部保存など、行いたい動作はユーザーによって異なる。
        // よって処理は使用者に委ねて、画面更新に必要な履歴一覧をこちら側でもらう。
        if (futureSendProcess != null) {
          packageUserChatAndHistoryModels.add(chatHistoryModel);
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
    this.myUserData,
    this.futureSendProcess,
    this.leftHistoryOptions,
    this.rightHistoryOptions,
    this.chatOption,
    this.allowSendingOfEmptyCharacters = false,
    Key? key
  }) : super(key: key);

  final UserData? myUserData;
  final FutureChatHistories futureChatHistories;
  final FutureSendProcess? futureSendProcess;
  final ChatHistoryOptions? leftHistoryOptions;
  final ChatHistoryOptions? rightHistoryOptions;
  final ChatHistoryOptions? chatOption;
  final bool allowSendingOfEmptyCharacters;

  // final loadingIndicator;
  @override
  Widget build(BuildContext context) {
    // debugPrint("ChatUi build");
    return FutureBuilder(
        future: futureChatHistories.futureHistoryModels,
        builder: (context, histories) {
          if (histories.hasData && histories.connectionState == ConnectionState.done) {
            return ChatUi(histories.data!,
                myUserData: myUserData,
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