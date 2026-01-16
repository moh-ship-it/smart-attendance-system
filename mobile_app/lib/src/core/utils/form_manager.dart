import 'package:flutter/material.dart';

class FormManager extends ChangeNotifier {
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, String?> _erorrs = {};
  final Map<String, bool> _isValid = {};

  void addController(String fieldName, TextEditingController controller) {
    _controllers[fieldName] = controller;
    _erorrs[fieldName] = null;
    _isValid[fieldName] = false;
    return _validateField(fieldName);
  }

  void _validateField(String fieldName) {
    final controller = _controllers[fieldName];
    if (controller != null) {
      _isValid[fieldName] = controller.text.isNotEmpty;
      notifyListeners();
    }
  }

  TextEditingController getController(String fieldName) {
    return _controllers[fieldName]!;
  }

  bool validateAll() {
    bool allValid = true;

    _controllers.forEach((fieldName, controller) {
      if (controller.text.isEmpty) {
        _erorrs[fieldName] = 'هذا الحقل مطلوب';
        allValid = false;
      } else {
        _erorrs[fieldName] = null;
      }
    });
    notifyListeners();
    return allValid;
  }

  // الحصول على errors
  String? getError(String fieldName) => _erorrs[fieldName];

  // معرفة إذا كان الفورم صالح
  bool get isFormValid {
    return _isValid.values.every((isValid) => isValid == true);
  }

  String getValue(String fieldName) => _controllers[fieldName]?.text ?? '';

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }
}
