# load_page

------

[English](./README.md) | 中文

------

## Features

* 实现app缺省页
* 支持全局配置
* 支持个性化配置和参数传递

## Usage

### 缺省页定义

```dart
class xxxWidget extends LoadWidget {

  xxxWidget({super.key});

  @override
  State<xxxWidget> createState() => _xxxWidgetState();
}

class _xxxWidgetState extends State<xxxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

* 调用`LoadWidget`的`onTap`方法，实现统一的刷新请求
* 调用`params`获取自定义参数

### 全局配置缺省页

```dart
LoadPage.defaultPages = () {
  return {
    LoadStatus.empty.name: LoadLottieWidget(Assets.lottiesEmpty),
    LoadStatus.loading.name: LoadLottieWidget(Assets.lottiesLoadding),
    LoadStatus.error.name: LoadLottieWidget(Assets.lottiesError),
  };
};
```

### 页面使用

```dart
LoadPage(
  onTap: () {
  },
  controler: controler.loadPageController,
  content: widget,
  params : 
  otherPages :
)

// update
loadPageController.showXXX();
```

