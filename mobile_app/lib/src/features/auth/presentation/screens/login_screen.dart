import 'package:flutter/material.dart';
import 'package:mobile_app/src/core/routes/app_routes.dart';
import 'package:mobile_app/src/core/shared_widgets/custom_card.dart';
import 'package:mobile_app/src/core/shared_widgets/custom_auth_text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/src/core/utils/form_manager.dart';
import 'package:mobile_app/src/features/home/presentation/widgets/background_with_dots.dart';
import '../providers/auth_notifier.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formManager = FormManager();
  bool _obscurePassword = true;
  void initState() {
    super.initState();
    _formManager.addController('email', TextEditingController());
    // _formManager.getValue('name');
    _formManager.addController("password", TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('LoginScreenPage'),
        backgroundColor: Color(0xFFF5F5F5),
      ),
      body: Center(
        child: CustomCard(
          childrens: Container(
            color: Colors.white,
            width: 350,
            height: 700,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.pinkAccent,
                      child: BackgroundWithDots(
                        child: Positioned(
                          // height: 1,
                          bottom: 1,
                          left: 140,
                          child: Card(
                            child: Image.asset('assetes/user_shield_64px.JPG'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'بوابة الادارة لنظام الحضور الذكي',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                SizedBox(height: 50),

                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' البريد الالكتروني',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          SizedBox(height: 10),
                          EmailTextField(
                            controller: _formManager.getController('email'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'كلمة المرور',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          PasswordTextField(
                            controller: _formManager.getController('password'),
                            obscureText: _obscurePassword,
                            onToggleVisibility: () => {
                              setState(
                                () => _obscurePassword = !_obscurePassword,
                              ),
                            },
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: authState.isLoading ? null : _logIn,
                              child: authState.isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.black,
                                    )
                                  : Text('تسجيل الدخول'),
                            ),
                          ),
                          if (authState.hasError)
                            Text(
                              authState.errorMessage ?? 'حدث خطأ',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.of(context).pushReplacementNamed(
                                  AppRoutes.mainBottomNavigation,
                                ),
                            child: Text('go to home'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          color: Colors.black,
        ),
      ),
    );
  }

  void _logIn() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(authStateProvider.notifier)
          .logIn(
            email: _formManager.getValue('email'),
            password: _formManager.getValue('password'),
          );
    }
  }
}
