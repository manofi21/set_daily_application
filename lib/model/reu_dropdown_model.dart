class ReuDropdownModel<T> {
  /// If label is empty, the the value gonna be label itself
  final String? label;
  final T value;

  ReuDropdownModel({this.label, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'label': label ?? value,
      'value': value,
    };
  }

  String get labelValue => label ?? value.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReuDropdownModel<T> &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          value == other.value;

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
}
