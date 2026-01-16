import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? value;
  final IconData? icon;
  final Color color;
  final Color? backColor;
  final String? trend;
  final Color? trendColor;
  final double? width;
  final IconData? Statistic; // احصائية
  final Widget? chield;
  final double? chatrWidth;
  final double? chatrHeight;
  final Color? chartColor;
  const StatCard({
    super.key,
    this.title,
    this.subTitle,
    this.value,
    this.icon,
    this.color = Colors.green,
    this.trend,
    this.trendColor,
    this.backColor,
    this.width,
    this.Statistic,
    this.chield,
    this.chatrWidth,
    this.chatrHeight,
    this.chartColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Card(
        color: backColor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon
                  if (icon != null)
                    (trend == null)
                        ? Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: color.withOpacity(0.1),
                              ),
                              child: Icon(icon, color: color, size: 25),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: color.withOpacity(0.1),
                            ),
                            child: Icon(icon, color: color, size: 24),
                          ),

                  // Trend
                  if (trend != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: (trendColor ?? color).withOpacity(0.1),
                      ),
                      child: Text(
                        trend!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: trendColor ?? color,
                        ),
                      ),
                    ),
                ],
              ),
              // Spacing
              SizedBox(height: 20),
              // Title
              if (Statistic != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '$title',
                          style: value != null
                              ? TextStyle(
                                  fontSize: 14,
                                  color: backColor != null
                                      ? Colors.white
                                      : Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                )
                              : TextStyle(
                                  fontSize: 20,
                                  color: backColor != null
                                      ? Colors.white
                                      : Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                        ),
                        SizedBox(height: 6),
                        // Value
                        Text(
                          '${value}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: backColor != null
                                ? Colors.white
                                : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Icon(Statistic, size: 50, color: Colors.white),
                  ],
                ),
              if (Statistic == null)
                Text(
                  ' $title',
                  style: value != null
                      ? TextStyle(
                          fontSize: 14,
                          color: backColor != null
                              ? Colors.white
                              : Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        )
                      : TextStyle(
                          fontSize: 30,
                          color: backColor != null
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                ),
              SizedBox(height: 6),
              // Value
              if (Statistic == null)
                if (value != null)
                  Text(
                    '${value}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: TextStyle(
                    fontSize: 14,
                    color: backColor != null ? Colors.white : Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              SizedBox(height: 20),
              if (chield != null) AspectRatio(aspectRatio: 2.0, child: chield),
            ],
          ),
        ),
      ),
    );
  }
}
