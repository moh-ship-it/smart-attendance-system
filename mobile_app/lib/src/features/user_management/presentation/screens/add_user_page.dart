import 'package:flutter/material.dart';
import 'package:mobile_app/src/core/shared_widgets/custom_text_field.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class AddUserPage extends StatelessWidget {
  AddUserPage({super.key});
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اضافة مستخدم جديد'), centerTitle: true),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[200],
            height: 790,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: 50,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'الاسم الكامل',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),

                    CustomTextField(
                      fillColor: Colors.white,
                      controller: name,
                      lableText: 'ادخل اسم الموظف',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ' الرقم الوظيفي',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    CustomTextField(
                      fillColor: Colors.white,
                      controller: name,
                      lableText: 'ادخل رقم الهوية الموظف',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'القسم',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(30),
                      dropdownColor: Colors.white,
                      hint: Text('اخترالقسم'),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text('تقنية المعلومات'),
                          enabled: true,
                          value: Text('mo'),
                        ),
                        DropdownMenuItem(
                          child: Text('الذكاء الاصطناعي'),
                          enabled: true,
                          value: Text('mo'),
                        ),
                        DropdownMenuItem(
                          child: Text(' الجرافيكس'),
                          enabled: true,
                          value: Text('mo'),
                        ),
                      ],
                      onChanged: (vl) {},
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'بطاقة الدخول الذكية',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber.withOpacity(0.3),
                            ),
                            child: Text(
                              'مطلوب ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[900],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Container(
                        width: 400,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: DashedBorder.all(
                            dashLength: 5,
                            color: Colors.purple,
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.document_scanner_sharp),
                            Text(
                              'اضغط هنا لمس البطاقة',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'قرب البطاقة من الهاتف لقراءة UID',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 15,
            right: 15,
            // top: 20,
            child: Container(
              color: Colors.amber,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('اضافة المستخدم'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
