import 'dart:async';

import 'package:flutter/material.dart';

/// 缺省页View需要继承的类
@immutable
abstract class LoadWidget extends StatefulWidget {
  /// 点击事件
  FutureOr Function(Map<String, String>? params)? onTap;

  /// 自定义参数
  Map<String, String>? params;

  LoadWidget({super.key});
}
