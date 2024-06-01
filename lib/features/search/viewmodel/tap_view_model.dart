import 'package:flutter/cupertino.dart';

final tapVm = TapViewModel();

class TapViewModel {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(false);

  ValueNotifier<bool> get valueNotifier => _valueNotifier;

  void toggleValue() {
    _valueNotifier.value = !_valueNotifier.value;
  }
}
