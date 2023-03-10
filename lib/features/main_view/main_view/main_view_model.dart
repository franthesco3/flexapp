import 'package:flexapp/features/main_view/main_view/main_view_controller.dart';

class MainViewModel extends MainViewProtocol {
  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  @override
  void onStartUi() {
    setLoading(true);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        setLoading(false);
      },
    );
  }

  void setLoading(bool loading) {
    _isLoading = loading;

    notifyListeners();
  }
}
