import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app/src/core/shared_widgets/state_card.dart';

class HomeSerren extends StatelessWidget {
  const HomeSerren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          centerTitle: false,
          title: ListTile(
            title: Text(
              'الصفحة الرئيسية',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('مرحبا محمد 👋'),
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.white, width: 4),

                color: const Color.fromARGB(255, 188, 157, 241),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(Icons.person, color: Colors.deepPurple[600]),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              margin: EdgeInsets.all(10),
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   width: 200,
                    //   child: Card(
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 20,
                    //         vertical: 20,
                    //       ),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         spacing: 15,
                    //         children: [
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Container(
                    //                 padding: EdgeInsets.all(10),
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(20),
                    //                   color: const Color.fromARGB(
                    //                     255,
                    //                     198,
                    //                     252,
                    //                     201,
                    //                   ),
                    //                 ),
                    //                 child: Icon(
                    //                   FontAwesomeIcons.personCircleCheck,
                    //                   color: Colors.green[400],
                    //                 ),
                    //               ),
                    //               Container(
                    //                 padding: EdgeInsets.all(5),
                    //                 decoration: BoxDecoration(
                    //                   color: const Color.fromARGB(
                    //                     255,
                    //                     198,
                    //                     252,
                    //                     201,
                    //                   ),
                    //                   borderRadius: BorderRadius.circular(20),
                    //                 ),
                    //                 child: Text(
                    //                   ' ⬆️ 2% ',
                    //                   style: TextStyle(
                    //                     color: Colors.green[400],
                    //                     fontWeight: FontWeight.bold,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Text('عدد الحاضرين'),
                    //           Text(
                    //             '42 ',
                    //             style: TextStyle(
                    //               fontSize: 30,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    StatCard(
                      title: 'عدد الحاضرين',
                      value: '45',
                      icon: FontAwesomeIcons.personCircleCheck,
                      trend: '⬆️ 2% ',
                      width: 170,
                    ),
                    StatCard(
                      title: 'عدد الغائبين',
                      value: '20',
                      icon: Icons.person_off_outlined,
                      color: Colors.red,
                      trend: '⬇️ 2% ',
                      trendColor: Colors.red,
                      width: 170,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                StatCard(
                  title: 'نسبة الحضور اليوم',
                  value: '90%',
                  // icon: Icons.circle_outlined,
                  // trend: "jjj",
                  Statistic: Icons.bar_chart_outlined,
                  color: Colors.deepPurple,
                  backColor: Colors.deepPurple,
                ),
                SizedBox(height: 20),
                StatCard(
                  title: 'التقرير الاسبوعي',
                  subTitle: 'متوسط الحضور اليومي',
                  // value: 'value',
                  chield: LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          axisNameWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('السبت'),
                              Text('الاحد'),
                              Text('الاثنين'),
                              Text('الثلاثاء'),
                              Text('الاربعاء'),
                              Text('الخميس'),
                            ],
                          ),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          curveSmoothness: 0.5,
                          preventCurveOverShooting: true,
                          preventCurveOvershootingThreshold: 10,
                          isCurved: true,
                          color: Colors.deepPurple,
                          shadow: Shadow(
                            blurRadius: 10,
                            color: Colors.purpleAccent,
                            offset: Offset(1, 15),
                          ),
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(1, 1),
                            FlSpot(2, 1),
                            FlSpot(3, 4),
                            FlSpot(4, 5),
                            FlSpot(5, 2),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      StatCard(
                        icon: Icons.person_add_alt_1,
                        title: '  اضافة مستخدم',
                        width: 140,
                      ),
                      StatCard(
                        title: 'تـصـديـر الــصـور',
                        width: 140,
                        icon: FontAwesomeIcons.download,
                        color: Colors.deepPurple,
                      ),
                      StatCard(
                        title: ' ســــجـل الــــــيوم',
                        width: 140,
                        icon: Icons.restore,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
