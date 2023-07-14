library load_page;

import 'package:flutter/material.dart';
import 'load_status.dart';
import 'load_widget.dart';

part 'load_controller.dart';

/// 缺省页
class LoadPage extends StatefulWidget {
  /// 控制器
  final LoadController loadController;

  /// 点击事件
  final void Function()? onTap;

  /// 自定义参数
  final Map<String, String>? params;

  /// content页面
  final Widget content;

  /// 自定义页面。自定义页面中的key会覆盖全局配置的key
  final Map<String, LoadWidget>? otherPages;

  /// 全局配置的默认页面
  static Map<String, LoadWidget>? Function() defaultPages = () => null;

  static Map<String, LoadWidget>? get _defaultPages => defaultPages.call();

  const LoadPage(
    this.loadController, {
    super.key,
    this.onTap,
    this.params,
    required this.content,
    this.otherPages,
  });

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  /// 当前展示的页面,默认为content
  String pageTag = LoadStatus.content.name;

  @override
  void initState() {
    super.initState();
    widget.loadController._bind(this);
  }

  @override
  Widget build(BuildContext context) {
    var pages = parsePages();
    return Stack(
      children: [
        Offstage(
          offstage: pageTag != LoadStatus.content.name,
          child: widget.content,
        ),
        for (var page in pages) page,
      ],
    );
  }

  /// 解析获取pages
  parsePages() {
    var pages = <Offstage>{};
    var pageMap = LoadPage._defaultPages ?? {};
    if (widget.otherPages != null) {
      pageMap.addAll(widget.otherPages!);
    }
    pageMap.forEach((tag, loadWidget) {
      loadWidget.onTap = widget.onTap;
      loadWidget.params = widget.params;
      pages.add(
        Offstage(
          offstage: tag != tag,
          child: loadWidget,
        ),
      );
    });
    return pages;
  }

  /// 切换页面的方法
  void showPage(String tag) {
    setState(() {
      tag = tag;
    });
  }
}
