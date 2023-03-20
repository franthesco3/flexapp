import 'package:flexapp/features/main_view/main_view/main_view_controller.dart';
import 'package:flexapp/support/utils/localize.dart';

class MainViewModel extends MainViewProtocol {
  String _fuel = '';
  double _valueFuel = 0;
  double _ethanol = 4.41;
  double _gasoline = 3.25;
  double _withEtanol = 0;
  bool _isLoading = false;
  bool _expEthanol = false;
  bool _expGasoline = false;
  double _withGasoline = 0;

  @override
  String get fuel => _fuel;

  @override
  bool get isLoading => _isLoading;

  @override
  bool get expEthanol => _expEthanol;

  @override
  bool get expGasoline => _expGasoline;

  @override
  String get valueFuel => _valueFuel.toStringAsFixed(2);

  @override
  String get ethanol => _ethanol.toStringAsFixed(2);

  @override
  String get gasoline => _gasoline.toStringAsFixed(2);

  @override
  void setExpEthanol() {
    _expEthanol = !_expEthanol;

    notifyListeners();
  }

  @override
  void setExpGasoline() {
    _expGasoline = !_expGasoline;

    notifyListeners();
  }

  @override
  void didTapEthanol() {
    onTapFuel?.call(Fuel.ethanol);
  }

  @override
  void didTapGasoline() {
    onTapFuel?.call(Fuel.gasoline);
  }

  @override
  void changedEthanol(String fuel) {
    if (fuel.isNotEmpty) _ethanol = double.parse(fuel);

    notifyListeners();
  }

  @override
  void changedGasoline(String fuel) {
    if (fuel.isNotEmpty) _gasoline = double.parse(fuel);

    notifyListeners();
  }

  @override
  void onSave() {
    _performance();
  }

  @override
  void onStartUi() {
    _setLoading(true);

    Future.delayed(const Duration(seconds: 2), () {
      _setLoading(false);
    });
  }

  void _setLoading(bool loading) {
    _isLoading = loading;

    notifyListeners();
  }

  void _performance() {
    final l10n = Localize.instance.l10n;

    _withEtanol = (22 * _ethanol);
    _withGasoline = (22 * _gasoline);

    if (_withEtanol <= _withGasoline) {
      _fuel = l10n.ethanolTitle;
      _valueFuel = _withEtanol;
    } else {
      _fuel = l10n.gasolineTitle;
      _valueFuel = _withEtanol;
    }

    notifyListeners();
  }
}
