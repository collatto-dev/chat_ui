import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ChatField extends StatelessWidget {
//   ChatField({this.onPressedSendButton, Key? key}) : super(key: key);
//
//   static const double _paddingSize = 10;
//   static const double _borderRadius = 10;
//   static const _maxLines = 6;
//
//   final SendMessageCallBack? onPressedSendButton;
//
//   String _text = "";
//
//   @override
//   Widget build(BuildContext context) {
//     debugPrint("Talk: build");
//     debugPrint("_text: $_text");
//     return Column(
//         children: [
//       _createSendButton(),
//       _createTextField(context)
//     ]);
//   }
//
//   Widget _createSendButton() {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(0, 0, _paddingSize, 0),
//       alignment: AlignmentDirectional.centerEnd,
//       child: ElevatedButton(
//         onPressed: () {
//           // TODO: 入力したデータを送信
//           debugPrint("talkField.getText(): $_text");
//           if (onPressedSendButton != null) {
//             onPressedSendButton!(_text);
//           }
//         },
//         child: const Icon(Icons.send),
//       ),
//     );
//   }
//
//   Container _createTextField(BuildContext context) {
//     final textEditingController = TextEditingController(text: _text);
//     return Container(
//         padding: const EdgeInsets.all(_paddingSize),
//         child: TextField(
//           controller: textEditingController,
//           keyboardType: TextInputType.multiline,
//           textInputAction: TextInputAction.newline,
//           maxLines: _maxLines,
//           decoration: InputDecoration(
//             enabledBorder: _createTextFieldDecoration(),
//             focusedBorder: _createTextFieldDecoration(),
//           ),
//           onChanged: (text) {
//             debugPrint("onChanged: $text");
//             _text = text;
//           },
//           onEditingComplete: () {
//             debugPrint("onEditingComplete");
//           },
//           onSubmitted: (text) {
//             debugPrint("onSubmitted: $text");
//             FocusScope.of(context).unfocus();},
//           onTapOutside: (text) {
//             debugPrint("onTapOutside: $text");
//             FocusScope.of(context).unfocus();},
//         )
//     );
//   }
//
//   OutlineInputBorder _createTextFieldDecoration() {
//     return OutlineInputBorder(
//         borderRadius: BorderRadius.circular(_borderRadius),
//         borderSide: const BorderSide(
//             color: Colors.blueAccent
//         )
//     );
//   }
//
//   String getText() {
//     return _text;
//   }
// }
class ChatField extends StatefulWidget {

  const ChatField({this.onPressedSendButton, Key? key}) : super(key: key);

  final SendMessageCallBack? onPressedSendButton;

  @override
  State<StatefulWidget> createState() => _ChatFieldState();
}

class _ChatFieldState extends State<ChatField> {

  static const double _paddingSize = 10;
  static const double _borderRadius = 10;
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
        onPressed: () {
          // TODO: 入力したデータを送信
          debugPrint("talkField.getText(): $_text");
          FocusScope.of(context).unfocus();
          if (widget.onPressedSendButton != null) {
            widget.onPressedSendButton!(_text);
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
        padding: const EdgeInsets.all(_paddingSize),
        child: TextField(
          controller: textEditingController,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: _maxLines,
          decoration: InputDecoration(
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
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: const BorderSide(
            color: Colors.blueAccent
        )
    );
  }

  String getText() {
    return _text;
  }
}

class ChatMessageNotifier extends ChangeNotifier {
  String message = "";

  void updateMessage(String message) {
    message = message;
    notifyListeners();
  }
}

typedef SendMessageCallBack = void Function(String message);