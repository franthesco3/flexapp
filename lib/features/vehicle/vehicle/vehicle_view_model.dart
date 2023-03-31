import '../../../models/vehicle.dart';
import 'vehicle_view_controller.dart';

class VehicleViewModel extends VehicleProtocol {
  String? _yearError;
  String? _modelError;
  String? _consumptionError;

  String _year = '';
  String _model = '';
  String _consumption = '';
  List<Vehicle> _vehicles = [];

  @override
  String get year => _year;

  @override
  String get model => _model;

  @override
  String get consumption => _consumption.toString();

  @override
  void addVehicle() {
    if (_isValidateForm) return;

    final vehicle = Vehicle(
      year: _year,
      model: _model,
      consumption: _consumption,
    );

    _vehicles.add(vehicle);

    onSaveSuccess?.call();

    notifyListeners();
  }

  @override
  void didTap() {
    showModalBottomShett?.call();
  }

  @override
  void onChangedYaer(String year) {
    _year = year;

    notifyListeners();
  }

  @override
  void onChangedModel(String model) {
    _model = model;

    notifyListeners();
  }

  @override
  void onChangedConsumption(String consumption) {
    _consumption = consumption.toString();

    notifyListeners();
  }

  String? _validateYear() {
    if (_year.isEmpty) return 'Campo de ano vazio!';
    return '';
  }

  String? _validateModel() {
    if (_model.isEmpty) return 'Campo de modelo vazio!';
    return '';
  }

  String? _validateConsumption() {
    if (_consumption.isEmpty) return 'Campo de ano vazio!';
    return '';
  }

  void _validateForm() {
    _yearError = _validateYear();
    _modelError = _validateModel();
    _consumptionError = _validateConsumption();

    notifyListeners();
  }

  bool get _isValidateForm {
    _validateForm();
    final validates = [_yearError, _modelError, _consumptionError];

    return validates.join().isNotEmpty;
  }
}
