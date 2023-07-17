part of load_page;

class LoadPageController {
  /// [LoadPage] sate.
  _LoadPageState? _state;

  /// 绑定LoadPage
  void _bind(_LoadPageState state) {
    _state = state;
  }

  void showError() {
    _state?.showPage(LoadStatus.error.name);
  }

  void showEmpty() {
    _state?.showPage(LoadStatus.empty.name);
  }

  void showLoading() {
    _state?.showPage(LoadStatus.loading.name);
  }

  void showContent() {
    _state?.showPage(LoadStatus.content.name);
  }

  void showOther() {
    _state?.showPage(LoadStatus.other.name);
  }

  void showCustom(String customTag) {
    _state?.showPage(customTag);
  }
}
