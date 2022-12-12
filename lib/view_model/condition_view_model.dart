import 'package:flutter/material.dart';
import 'package:hms_16/model/condition_model.dart';

class ConditionViewModel extends ChangeNotifier {
  List<ConditionModel> _condition = [];
  List<ConditionModel> get conditions => _condition;

  insertCondition(ConditionModel newCondition) {
    FocusManager.instance.primaryFocus?.unfocus();
    _condition = [newCondition, ..._condition];
    notifyListeners();
  }
}
