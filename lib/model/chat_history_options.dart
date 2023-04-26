import 'package:chat_ui/chat_history.dart';
import 'package:flutter/material.dart';

// 履歴の色、枠線周りはここで定義
class ChatHistoryOptions {

  const ChatHistoryOptions({
    // 履歴上で表示する名前の上下位置を指定する。
    this.namePosition = NamePosition.bottom,
    this.fontSize,
    this.fontColor,
    this.maxLines,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.borderPadding
  });

  final NamePosition namePosition;
  final double? fontSize;
  final Color? fontColor;
  final int? maxLines;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  // 履歴の上下左右のパディング
  final EdgeInsetsGeometry? borderPadding;
}