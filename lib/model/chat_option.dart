import 'dart:ui';

import 'package:chat_ui/chat_history.dart';
import 'package:flutter/material.dart';

// 履歴の色、枠線周りはここで定義

class HistoryOption {

  const HistoryOption({
    this.namePosition = NamePosition.top,
    this.fontSize,
    this.fontColor,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.historyPadding
  });

  final NamePosition? namePosition;
  final double? fontSize;
  final Color? fontColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  // 履歴の上下左右のパディング
  final EdgeInsetsGeometry? historyPadding;
}