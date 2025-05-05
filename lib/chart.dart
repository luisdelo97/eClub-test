import 'package:eclub/formatter.dart';
import 'package:eclub/gastos/widgets/gatos_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatefulWidget {
  final int? index;
  final String centerTitle;
  final double centerSubtitle;
  const DoughnutChart({
    super.key,
    this.index,
    required this.centerTitle,
    required this.centerSubtitle,
  });

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  late List<ChartData> _chartData;

  @override
  void initState() {
    final id = widget.index;
    if (id != null) {
      _chartData = [getChartData[id]];
    } else {
      _chartData = getChartData;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCircularChart(
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            height: '100%',
            width: '100%',
            widget: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Text(
                    widget.centerTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Gs. ${formatNumber(widget.centerSubtitle)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        series: <CircularSeries>[
          // Initialize line series
          DoughnutSeries<ChartData, String>(
            name: 'Doughnut Chart',
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            pointColorMapper: (ChartData data, _) => data.color,
            radius: '100%',
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              builder: (data, point, series, pointIndex, seriesIndex) {
                final pointData = _chartData[pointIndex];
                return switch (pointData.x) {
                  'Restaurantes y Bares' => const Icon(Icons.restaurant),
                  'Compras' => const Icon(Icons.shopping_cart),
                  'Transporte' => const Icon(Icons.directions_bus),
                  'Entretenimiento' => const Icon(Icons.movie),
                  _ => const Icon(Icons.no_accounts),
                };
              },
            ),
            onPointTap: (pointInteractionDetails) {
              final pointIndex = pointInteractionDetails.pointIndex;
              if (widget.index != null) {
                return;
              } else {
                context.pushNamed(
                  'gastoIdx',
                  pathParameters: {
                    'gastoIdx': pointIndex.toString(),
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  List<ChartData> get getChartData => GastosData.getGastos
      .map(
        (e) => ChartData(
          e.category,
          e.total,
          e.color,
        ),
      )
      .toList();
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
