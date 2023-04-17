import 'package:chat_ui/chat_history.dart';
import 'package:chat_ui/model/chat_history_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chat_ui/chat_ui.dart';

void main() {
  test('adds one to input values', () {
    final chatHistoryModel = ChatHistoryModel(
      history: "hellow",
      historyPosition: HistoryPosition.right,
      name: "Taro",
      datetime: "2023/1/1"
    );
    // expect(chatHistoryModel.history, "hellow");
    // expect(chatHistoryModel.history, HistoryPosition.right);
    // expect(chatHistoryModel.history, "hellow");
    // expect(chatHistoryModel.history, "hellow");
    // expect(chatHistoryModel.history, "hellow");
    // chatHistoryModel
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), "Taro");
    // expect(calculator.addOne(0), 2023/1/1);
  });
}
