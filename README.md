# load_page

------

English | [中文](./README_CN.md)

------

## Features

* Implement app default page
* Supports global configuration
* Support personalized configuration and parameter transfer

## Usage

### Default Page Definition

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

* Call the 'onTap' method of 'LoadWidget' to achieve unified refresh requests
* Call 'params' to obtain custom parameters

### Global Configuration Default Page

```dart
LoadPage.defaultPages = () {
  return {
    LoadStatus.empty.name: LoadLottieWidget(Assets.lottiesEmpty),
    LoadStatus.loading.name: LoadLottieWidget(Assets.lottiesLoadding),
    LoadStatus.error.name: LoadLottieWidget(Assets.lottiesError),
  };
};
```

### Page Usage

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

