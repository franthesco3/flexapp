extension StringFormatter on String {
  String toFixed(double price) {
    return price.toStringAsFixed(2).replaceAll('.', ',');
  }
}
