class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الالكتروني مطلوب';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegex.hasMatch(value)) {
      return 'البريد الالكتروني غير صحيح';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'يجب أن تحتوي على رقم واحد على الأقل';
    }

    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم مطلوب';
    }
    if (value.length < 3) {
      return 'الاسم يجب ان يكون ثلاثه احرف على الاقل';
    }
    if (value.length > 50) {
      return ' يجب ان لا يتجاوز الاسم 50 حرف';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرقم مطلوب';
    }

    final phoneRegex = RegExp(r'^05[0-9]{8}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'رقم الهاتف يحب ان يبدا ب 05 ويتكون من 9 ارقام';
    }
    return null;
  }
}
