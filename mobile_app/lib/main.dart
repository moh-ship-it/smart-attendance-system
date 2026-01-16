import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/src/core/routes/app_routes.dart';
import 'package:mobile_app/src/features/auth/presentation/screens/login_screen.dart';

void main() async {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'), // اللغة الافتراضية عربية
      supportedLocales: const [
        Locale('ar'), // العربية
        Locale('en'), // الإنجليزية
      ],

      // 🔧 إعدادات الـ localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate, // إضافة هذا
      ],

      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, // اتجاه النص من اليمين لليسار
          child: child!,
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      home: LoginScreen(),
    );
  }
}
