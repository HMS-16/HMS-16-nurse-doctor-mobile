import 'package:flutter/material.dart';

enum ActionState {
  none,
  loading,
  error,
}

class GeneralViewModel extends ChangeNotifier {
  ActionState _state = ActionState.none;
  ActionState get state => _state;

  void changeState(ActionState state) {
    _state = state;
    notifyListeners();
  }
}