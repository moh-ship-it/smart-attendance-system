import 'package:flutter/material.dart';

import '../utils/input_validators.dart';
import 'custom_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.controller, this.onChanged});
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      lableText: 'البريد الالكتروني',
      hintText: 'example@email.com',
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(Icons.email),
      validator: Validators.email,
      onChanged: onChanged,
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.onToggleVisibility,
    this.obscureText = true,
    this.onChanged,
  });
  final TextEditingController controller;
  final VoidCallback? onToggleVisibility;
  final bool obscureText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      lableText: 'كلمة المرور',
      hintText: 'ادخل كلمة المرور',
      obscureText: obscureText,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
        onPressed: onToggleVisibility,
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
      ),
      validator: Validators.password,
      onChanged: onChanged,
    );
  }
}

class NameTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const NameTextField({Key? key, required this.controller, this.onChanged})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      lableText: 'الاسم ',
      hintText: 'أدخل اسم المستخدم',
      prefixIcon: Icon(Icons.person),
      validator: Validators.name,
      onChanged: onChanged,
    );
  }
}
