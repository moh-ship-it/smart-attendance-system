import 'package:flutter/material.dart';
import 'package:mobile_app/src/core/routes/app_routes.dart';
import 'package:mobile_app/src/core/shared_widgets/user_card_widget.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ادارة المستخدمين'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
        leading: const Icon(Icons.arrow_back),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 80,
            ),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UniversalUserCard(
                    userName: 'محمد التهامي',
                    userRole: 'تقنية المعلومات',
                    bottomContent: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            _buildInfoChip('12022'),
                            _buildInfoChip('JJMKK'),
                          ],
                        ),
                        const Spacer(),
                        _buildActionButton(
                          Icons.edit_sharp,
                          Colors.deepPurple,
                          () {},
                        ),
                        const SizedBox(width: 4),
                        _buildActionButton(
                          Icons.delete_forever_sharp,
                          Colors.red,
                          () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, //
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.withOpacity(0.8),

                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.addUserPage);
                },
                child: const Text(
                  'اضافة مستخدم جديد',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      color: Colors.grey[200],
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
