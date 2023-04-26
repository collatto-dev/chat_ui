import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_history_options.dart';
import 'package:flutter/material.dart';

class ChatHistory extends StatelessWidget {

  const ChatHistory(this.chatHistoryModel, {
    required this.historyOptions,
    required this.historyPosition,
    Key? key
  }): super(key: key);

  static const double _borderRadius = 10;
  static const double _borderWidth = 1.0;
  static const _minLines = 1;
  static const _maxLines = 6;

  final ChatHistoryModel chatHistoryModel;
  final ChatHistoryOptions historyOptions;
  final HistoryPosition historyPosition;

  @override
  Widget build(BuildContext context) {
    // TODO:HistoryTypeでpadding, 色調整
    return _createNameAndHistoryField(context);
  }

  Widget _createNameAndHistoryField(BuildContext context) {
    final displaySize = MediaQuery.of(context).size;
    List<Widget> nameAndHistoryField = [];
    String? name = chatHistoryModel.userData?.userName;
    if (name == null || name.isEmpty) {
      return _createHistoryField(displaySize);
    }

    if (historyOptions.namePosition == NamePosition.top) {
      nameAndHistoryField.add(_createNameField(displaySize, name));
      nameAndHistoryField.add(_createHistoryField(displaySize));
    } else if (historyOptions.namePosition == NamePosition.bottom) {
      nameAndHistoryField.add(_createHistoryField(displaySize));
      nameAndHistoryField.add(_createNameField(displaySize, name));
    }
    return Column(children: nameAndHistoryField);
  }

  Widget _createNameField(Size displaySize, String name) {
    AlignmentGeometry alignment;
    if (historyPosition == HistoryPosition.left) {
      alignment = Alignment.centerLeft;
    } else {
      alignment = Alignment.centerRight;
    }
    return Container(
    alignment: alignment,
      padding: _createDefaultNamePadding(displaySize),
      child: Text(name),
    );
  }

  Widget _createHistoryField(Size displaySize) {
    return Container(
        alignment: FractionalOffset.centerRight,
        padding: historyOptions.borderPadding ?? _createDefaultHistoryPadding(displaySize),
        child: TextField(
          controller: TextEditingController(text: chatHistoryModel.history),
          minLines: _minLines,
          maxLines: historyOptions.maxLines ?? null ,
          style: TextStyle(
            fontSize: historyOptions.fontSize,
            color: historyOptions.fontColor,
          ),
          decoration: InputDecoration(
            fillColor: historyOptions.backgroundColor,
            filled: true,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(historyOptions.borderRadius ?? _borderRadius),
                borderSide: BorderSide(
                    width: historyOptions.borderWidth ?? _borderWidth,
                    color: historyOptions.borderColor ?? Colors.grey
                )
            ),
          ),
          enabled: false,
        )
    );
  }

  EdgeInsetsGeometry _createDefaultNamePadding(Size displaySize) {
    double topPadding = 0;
    double bottomPadding = 0;
    if (chatHistoryModel.userData?.userName == null || chatHistoryModel.userData!.userName!.isEmpty) {
      // NOP
    } else if (historyOptions.namePosition == NamePosition.top) {
      topPadding = displaySize. height / 50;
    } else if (historyOptions.namePosition == NamePosition.bottom) {
      bottomPadding = displaySize. height / 50;
    }
    return _createDefaultPadding(
        topPadding: topPadding,
        bottomPadding: bottomPadding,
        horizontalBigPadding: displaySize.width / 5,
        horizontalSmallPadding: displaySize.width / 50);
  }

  EdgeInsetsGeometry _createDefaultHistoryPadding(Size displaySize) {
    double topPadding = 0;
    double bottomPadding = 0;
    if (chatHistoryModel.userData?.userName == null || chatHistoryModel.userData!.userName!.isEmpty) {
      topPadding = displaySize.height / 50;
      bottomPadding = displaySize.height / 50;
    } else if (historyOptions.namePosition == NamePosition.top) {
      bottomPadding = displaySize.height / 50;
    } else if (historyOptions.namePosition == NamePosition.bottom) {
      topPadding = displaySize.height / 50;
    }
    return _createDefaultPadding(
        topPadding: topPadding,
        bottomPadding: bottomPadding,
        horizontalBigPadding: displaySize.width / 5,
        horizontalSmallPadding: displaySize.width / 50);
  }

  //
  EdgeInsetsGeometry _createDefaultPadding({
    required double topPadding,
    required double bottomPadding,
    required double horizontalBigPadding,
    required double horizontalSmallPadding,}) {
    // if (chatHistoryModel.historyPosition == HistoryPosition.left) {
    if (historyPosition == HistoryPosition.left) {
      return EdgeInsets.fromLTRB(
          horizontalSmallPadding, topPadding,
          horizontalBigPadding, bottomPadding);
    } else {
      return EdgeInsets.fromLTRB(
          horizontalBigPadding, topPadding,
          horizontalSmallPadding, bottomPadding);
    }
  }
}

// 履歴の表示位置（左右）
enum HistoryPosition {
  left, right
}

// 履歴の投稿者名の表示位置（上下）
enum NamePosition {
  top, bottom
}