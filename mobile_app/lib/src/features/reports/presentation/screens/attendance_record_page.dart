import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile_app/src/core/shared_widgets/custom_text_field.dart';
import 'package:mobile_app/src/core/shared_widgets/state_card.dart';
import 'package:mobile_app/src/core/shared_widgets/user_card_widget.dart';

class AttendanceRecordPage extends StatelessWidget {
  AttendanceRecordPage({super.key});
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('سجل الحضور'), centerTitle: true),

      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: search,
              lableText: 'بحث باسم الموظف',
              fillColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(thickness: 1),
            ),
            SafeArea(
              child: Row(
                children: [
                  StatCard(
                    title: '       حاضر ',
                    icon: Icons.task_alt_rounded,
                    value: '    45',
                    width: 125,
                    // chield: Center(child: Column(children: [Text('data')])),
                  ),
                  StatCard(
                    title: '       غائب ',
                    icon: FontAwesomeIcons.remove,
                    color: Colors.red,
                    value: '    45',
                    width: 125,
                    // chield: Center(child: Column(children: [Text('data')])),
                  ),
                  StatCard(
                    title: '       متاخر ',
                    icon: Icons.restore,
                    color: Colors.orange.shade900,
                    value: '    45',
                    width: 125,
                    // chield: Center(child: Column(children: [Text('data')])),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                'قائمة الموظفين',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
            // بطاقة المستخدم
            UniversalUserCard(
              userName: 'محمد التهامي',
              userRole: 'تقنية المعلومات',
              statusTag: _buildStatusTag(status: 'متأخر', icon: Icons.done),
              bottomContent: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTimeInfo(label: 'دخول', value: '8:55 AM'),
                    SizedBox(
                      height: 30, // حدد الارتفاع هنا
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.black12,
                      ),
                    ),
                    _buildTimeInfo(label: 'خروج', value: 'PM 5:20'),
                    SizedBox(
                      height: 30, // حدد الارتفاع هنا
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.black12,
                      ),
                    ),
                    _buildTimeInfo(label: 'الساعات', value: '8'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة عرض حالة المستخدم مثل حاضر او غائب او متاخر
  Widget _buildStatusTag({required String status, required IconData icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (status == 'غائب' || status == 'متأخر')
            ? Colors.red.withOpacity(0.3)
            : Colors.green.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 22,
            height: 21,
            decoration: BoxDecoration(
              color: (status == 'متأخر' || status == 'غائب')
                  ? Colors.red
                  : Colors.green[600],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              status == 'حاضر'
                  ? Icons.done
                  : status == 'متأخر'
                  ? Icons.restore_rounded
                  : Icons.cancel_sharp,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(width: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 17,
              color: (status == 'حاضر') ? Colors.green : Colors.red,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInfo({required String label, required String value}) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
