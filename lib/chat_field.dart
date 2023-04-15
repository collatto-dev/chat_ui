import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/model/chat_history_model.dart';
import 'package:chat_ui/model/chat_history_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatField extends StatefulWidget {

  const ChatField({
    this.myName,
    this.chatOptions,
    this.onPressedSendButton,
    Key? key
  }) : super(key: key);

  final String? myName;
  final ChatHistoryOptions? chatOptions;
  final SendMessageCallBack? onPressedSendButton;

  @override
  State<StatefulWidget> createState() => _ChatFieldState();
}

class _ChatFieldState extends State<ChatField> {

  static const double _paddingSize = 10;
  static const double _borderRadius = 10;
  static const double _borderWidth = 1.0;
  static const _maxLines = 6;

  String _text = "";

  @override
  Widget build(BuildContext context) {
    debugPrint("Talk: build");
    debugPrint("_text: $_text");
    return Column(
        children: [
          _createSendButton(),
          _createTextField(context)
        ]);
  }

  Widget _createSendButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, _paddingSize, 0),
      alignment: AlignmentDirectional.centerEnd,
      child: ElevatedButton(
        onPressed: () async {
          // TODO: 入力したデータを送信
          debugPrint("talkField.getText(): $_text");
          FocusScope.of(context).unfocus();
          if (widget.onPressedSendButton != null) {
            widget.onPressedSendButton!(ChatHistoryModel(
                history: _text, historyPosition: HistoryPosition.right,
                name: widget.myName
            ));
          }
          setState(() {
            _text = "";
          });
        },
        child: const Icon(Icons.send),
      ),
    );
  }

  Container _createTextField(BuildContext context) {
    final textEditingController = TextEditingController(text: _text);
    return Container(
        padding: widget.chatOptions?.borderPadding ?? const EdgeInsets.all(_paddingSize),
        child: TextField(
          controller: textEditingController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: widget.chatOptions?.maxLines ?? _maxLines,
          style: TextStyle(
            fontSize: widget.chatOptions?.fontSize,
            color: widget.chatOptions?.fontColor,
          ),
          decoration: InputDecoration(
            fillColor: widget.chatOptions?.backgroundColor,
            filled: true,
            enabledBorder: _createTextFieldDecoration(),
            focusedBorder: _createTextFieldDecoration(),
          ),
          onChanged: (text) {
            debugPrint("onChanged: $text");
            _text = text;
          },
          onEditingComplete: () {
            debugPrint("onEditingComplete");
          },
          onSubmitted: (text) {
            debugPrint("onSubmitted: $text");
            FocusScope.of(context).unfocus();},
          onTapOutside: (text) {
            debugPrint("onTapOutside: $text");
            FocusScope.of(context).unfocus();},
        )
    );
  }

  OutlineInputBorder _createTextFieldDecoration() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            widget.chatOptions?.borderRadius ?? _borderRadius),
        borderSide: BorderSide(
            width: widget.chatOptions?.borderWidth ?? _borderWidth,
            color: widget.chatOptions?.borderColor ?? Colors.blueAccent
        )
    );
  }

  String getText() {
    return _text;
  }
}

typedef SendMessageCallBack = void Function(ChatHistoryModel chatHistoryModel);