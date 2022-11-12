//number with commas
extension NumberComma on num {
  String get comma => toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
}

//capitalise first letter
extension Capitalise on String {
  String get capitalise => '${this[0].toUpperCase()}${substring(1)}';
}
