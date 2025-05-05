import 'package:eclub/color_theme.dart';
import 'package:eclub/shared/chart.dart';
import 'package:eclub/gastos/widgets/extracto_button.dart';
import 'package:eclub/gastos/widgets/gatos_data.dart';
import 'package:eclub/shared/menu_button.dart';
import 'package:eclub/gastos/widgets/month_list.dart';
import 'package:eclub/shared/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GastosView extends StatefulWidget {
  final int? index;
  const GastosView({super.key, this.index});

  @override
  State<GastosView> createState() => _GastosViewState();
}

class _GastosViewState extends State<GastosView> {
  late List<TransactionItem> _transactions;
  late String _title;
  List<String> get _monthList => [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Mayo',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre'
      ];

  void onSelectionMonth(int index) {
    _title = _monthList[index];
    setState(() {});
  }

  @override
  void initState() {
    _title = _monthList[0];
    _transactions = _geTransactions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        title: const Text('Gastos'),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          color: onSurfaceColor,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: surfaceColor,
        actions: const [
          MenuButton(color: onSurfaceColor),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            child: MonthList(
              month: _monthList,
              onMonthSelected: onSelectionMonth,
            ),
          ),
          DoughnutChart(
            index: widget.index,
            centerTitle: _title,
            centerSubtitle: _totalAmountCenterChart,
          ),
          Expanded(
            child: TransactionList(
              transactions: _transactions,
            ),
          ),
          const ExtractoButton()
        ],
      ),
    );
  }

  double get _totalAmountCenterChart {
    final index = widget.index;
    if (index != null) {
      final totalsItem =
          GastosData.getGastos[index].items.map((e) => e.amount).toList();
      return totalsItem.reduce((value, element) => value + element);
    } else {
      final totalsCategory = GastosData.getGastos.map((e) => e.total).toList();
      return totalsCategory.reduce((value, element) => value + element);
    }
  }

  List<TransactionItem> get _geTransactions {
    final index = widget.index;
    if (index != null) {
      final gastos = GastosData.getGastos[index];
      return gastos.items.map((e) {
        return TransactionItem(
          color: gastos.color,
          nameSvg: gastos.nameSvg,
          title: e.title,
          category: gastos.category,
          total: e.amount,
          date: e.date,
          onTap: () {
            context.pushNamed(
              'movIdx',
              pathParameters: {
                'gastoIdx': index.toString(),
                'movIdx': gastos.items.indexOf(e).toString(),
              },
            );
          },
        );
      }).toList();
    } else {
      return GastosData.getGastos.map((e) {
        return TransactionItem(
          color: e.color,
          nameSvg: e.nameSvg,
          title: e.category,
          total: e.total,
        );
      }).toList();
    }
  }
}
