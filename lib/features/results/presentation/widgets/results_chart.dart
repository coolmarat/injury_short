import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/trauma_type_model.dart';

class ResultsChart extends StatelessWidget {
  final Map<String, int> answers;
  final List<TraumaTypeModel> traumaTypes;
  
  const ResultsChart({
    super.key, 
    required this.answers, 
    required this.traumaTypes
  });
  
  BarChartGroupData _generateBarGroup(
    int x,
    double value,
    Color color,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 25,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final List<Color> barColors = [
      Colors.blue[200]!,
      Colors.green[200]!,
      Colors.orange[200]!,
      Colors.purple[200]!,
      Colors.red[200]!,
    ];
    
    final typeOrder = traumaTypes.map((t) => t.type).toList();
    final orderedEntries = typeOrder
        .map((type) => MapEntry(type, answers[type] ?? 0))
        .toList();
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _calculateMaxY(),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < orderedEntries.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        orderedEntries[index].key,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return const Text('');
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 1,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1,
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(color: Colors.black, width: 1),
              left: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          barGroups: List.generate(
            orderedEntries.length,
            (index) => _generateBarGroup(
              index,
              orderedEntries[index].value.toDouble(),
              barColors[index % barColors.length],
            ),
          ),
        ),
      ),
    );
  }
  
  // Calculate the maximum Y value based on the actual data
  double _calculateMaxY() {
    // Find the maximum value in the answers
    final maxValue = answers.values.isEmpty ? 6 : answers.values.reduce((max, value) => max > value ? max : value).toDouble();
    
    // Add a small margin (20%) for better visualization
    return maxValue <= 0 ? 6 : (maxValue * 1.2).ceilToDouble();
  }
}
