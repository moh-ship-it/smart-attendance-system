import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app/src/app/main_bottom_navigationbar_notifier.dart';
import 'package:mobile_app/src/features/home/presentation/screens/home_serren.dart';
import 'package:mobile_app/src/features/reports/presentation/screens/attendance_record_page.dart';
import 'package:mobile_app/src/features/user_management/presentation/screens/user_management_page.dart';

class MainBottomNavigationbar extends ConsumerWidget {
  MainBottomNavigationbar({super.key});
  final List<Widget> _screens = [
    HomeSerren(),
    UserManagementPage(),
    AttendanceRecordPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(bottomProvider);
    return Scaffold(
      body: _screens[bottomIndex],
      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          // maxWidth: 300,
          height: 70,
          letIndexChange: (index) => true,
          animationCurve: Curves.easeInOutQuint,
          buttonBackgroundColor: Colors.grey,
          backgroundColor: Colors.deepPurple,
          index: bottomIndex,
          onTap: (index) {
            ref.read(bottomProvider.notifier).setIndex(index);
          },
          items: [
            Icon(Icons.home, color: Colors.deepPurpleAccent, size: 20),
            Icon(Icons.people, color: Colors.deepPurpleAccent, size: 20),
            Icon(Icons.report, color: Colors.deepPurpleAccent, size: 20),
          ],
        ),
      ),
    );
  }
}
