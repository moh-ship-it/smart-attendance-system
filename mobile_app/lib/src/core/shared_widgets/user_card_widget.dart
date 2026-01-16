import 'package:flutter/material.dart';

class UniversalUserCard extends StatelessWidget {
  final String userName;
  final String userRole;
  final Widget? imageWidget; // صورة الشخص أو أيقونة افتراضية
  final Widget? statusTag; // الـ "Tag" الأخضر مثل (حاضر)
  final Widget bottomContent; // المحتوى المتغير (أزرار أو تفاصيل حضور)
  final Color? cardColor;

  const UniversalUserCard({
    super.key,
    required this.userName,
    required this.userRole,
    required this.bottomContent,
    this.imageWidget,
    this.statusTag,
    this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: cardColor ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // الجزء العلوي: الاسم والصورة والحالة
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // عرض الصورة الشخصية أو أيقونة افتراضية
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[100],
                  child: ClipOval(
                    child:
                        imageWidget ??
                        const Icon(Icons.person, size: 30, color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      userRole,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),

                const Spacer(),
                if (statusTag != null) statusTag!,
              ],
            ),

            const SizedBox(height: 16),
            const Divider(height: 1), // الخط الأفقي في الوسط للتنظيم
            const SizedBox(height: 16),

            // الجزء السفلي: المحتوى المتغير (The Slot)
            bottomContent,
          ],
        ),
      ),
    );
  }
}
