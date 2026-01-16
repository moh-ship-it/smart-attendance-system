import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomCard extends StatelessWidget {
  final Widget childrens;
  final Color color;

  const CustomCard({super.key, required this.childrens, required this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 3,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black,
      // child: Card(child: Text(''), margin: EdgeInsets.all(10)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            //  يمنع أي overflow في المساحات الصغيرة
            physics: const NeverScrollableScrollPhysics(),
            child: childrens,
          );
        },
      ),
    );
  }
}
