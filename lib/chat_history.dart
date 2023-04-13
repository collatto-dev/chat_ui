import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatHistory extends StatelessWidget {

  const ChatHistory(
      this.chatHistoryModel,
      {
        this.historyOption,
        Key? key}): super(key: key);

  static const double _borderRadius = 10;
  static const double _borderWidth = 1.0;
  static const _minLines = 1;
  static const _maxLines = 6;

  final ChatHistoryModel chatHistoryModel;
  // final HistoryType? historyType;
  final HistoryOption? historyOption;

  // @override
  // Widget build(BuildContext context) {
  //   // TODO:HistoryTypeでpadding, 色調整
  //   return  Container(
  //     alignment: FractionalOffset.centerRight,
  //     padding: historyOption?.historyPadding ?? _createDefaultHistoryPadding(context),
  //     child: _createNameAndHistoryField(context)
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    // TODO:HistoryTypeでpadding, 色調整
    debugPrint("ChatHistory build");
    debugPrint("chatHistoryModel.history: ${chatHistoryModel.history}");
    return  _createNameAndHistoryField(context);
  }

  Widget _createNameAndHistoryField(BuildContext context) {
    List<Widget> nameAndHistoryField = [];
    String? name = chatHistoryModel.name;
    if (name == null) {
      return _createHistoryField(context);
    }

    if (historyOption?.namePosition == NamePosition.top) {
      nameAndHistoryField.add(_createNameField(context, name));
      nameAndHistoryField.add(_createHistoryField(context));
    } else {
      nameAndHistoryField.add(_createHistoryField(context));
      nameAndHistoryField.add(_createNameField(context, name));
    }
    return Column(children: nameAndHistoryField);
  }

  Widget _createNameField(BuildContext context, String name) {
    AlignmentGeometry alignment;
    if (chatHistoryModel.historyType == HistoryType.partner) {
      alignment = Alignment.centerLeft;
    } else {
      alignment = Alignment.centerRight;
    }
    print("name: $name");
    return Container(
    alignment: alignment,
      padding: _createDefaultNamePadding(context),
      child: Text(name),
    );
  }

  Widget _createHistoryField(BuildContext context) {
    return Container(
        alignment: FractionalOffset.centerRight,
        padding: historyOption?.historyPadding ?? _createDefaultHistoryPadding(context),
        child: TextField(
          controller: TextEditingController(text: chatHistoryModel.history),
          minLines: _minLines,
          maxLines: _maxLines,
          style: TextStyle(
            fontSize: historyOption?.fontSize,
            color: historyOption?.fontColor,
          ),
          decoration: InputDecoration(
            fillColor: historyOption?.backgroundColor,
            filled: true,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(historyOption?.borderRadius ?? _borderRadius),
                borderSide: BorderSide(
                    width: historyOption?.borderWidth ?? _borderWidth,
                    color: historyOption?.borderColor ?? Colors.grey
                )
            ),
          ),
          enabled: false,
        )
    );
  }

  EdgeInsetsGeometry _createDefaultNamePadding(BuildContext context) {
    final displaySize = MediaQuery.of(context).size;
    double topPadding = 0;
    double bottomPadding = 0;
    if (chatHistoryModel.name != null &&
        historyOption?.namePosition == NamePosition.top) {
      topPadding = displaySize. height / 50;
    } else if (chatHistoryModel.name != null &&
        historyOption?.namePosition == NamePosition.bottom) {
      bottomPadding = displaySize. height / 50;
    }
    debugPrint("_createDefaultNamePadding topPadding: $topPadding, bottomPadding: $bottomPadding");

    return _createDefaultPadding(
        topPadding: topPadding,
        bottomPadding: bottomPadding,
        horizontalBigPadding: displaySize.width / 5,
        horizontalSmallPadding: displaySize.width / 50);
  }

  EdgeInsetsGeometry _createDefaultHistoryPadding(BuildContext context) {
    final displaySize = MediaQuery.of(context).size;
    double topPadding = 0;
    double bottomPadding = 0;
    if (chatHistoryModel.name == null) {
      topPadding = displaySize. height / 50;
      bottomPadding = displaySize. height / 50;
    }
    if (historyOption?.namePosition == NamePosition.top) {
      bottomPadding = displaySize. height / 50;
    } else if (historyOption?.namePosition == NamePosition.bottom) {
      topPadding = displaySize. height / 50;
    }
    debugPrint("_createDefaultHistoryPadding topPadding: $topPadding, bottomPadding: $bottomPadding");
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
    if (chatHistoryModel.historyType == HistoryType.partner) {
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

enum HistoryType {
  partner, user
}

enum NamePosition {
  top, bottom
}