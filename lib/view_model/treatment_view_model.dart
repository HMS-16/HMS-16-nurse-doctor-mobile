import 'package:flutter/material.dart';
import 'package:hms_16/Models/treatment_model.dart';

class TreatmentViewModel extends ChangeNotifier {
  List<TreatmentModel> _treatment = [];
  List<TreatmentModel> get treatments => _treatment;

  insertTreatment(TreatmentModel newTreatment) {
    FocusManager.instance.primaryFocus?.unfocus();
    _treatment = [newTreatment, ..._treatment];
    notifyListeners();
  }
}