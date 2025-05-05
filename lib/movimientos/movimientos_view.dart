import 'package:eclub/color_theme.dart';
import 'package:eclub/formatter.dart';
import 'package:eclub/gastos/widgets/gatos_data.dart';
import 'package:eclub/shared/menu_button.dart';
import 'package:eclub/movimientos/widgets/receipt_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovimientosView extends StatefulWidget {
  final int movIdx;
  final int gastoIdx;
  const MovimientosView(
      {super.key, required this.movIdx, required this.gastoIdx});

  @override
  State<MovimientosView> createState() => _MovimientosViewState();
}

class _MovimientosViewState extends State<MovimientosView> {
  late GastosData _gastosData;
  @override
  void initState() {
    _gastosData = GastosData.getGastos[widget.gastoIdx];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movIdx = widget.movIdx;
    final item = _gastosData.items[movIdx];
    return Scaffold(
      backgroundColor: surfaceColor,
      body: Column(
        spacing: 30,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.65,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                colors: [
                  primaryColor,
                  secondaryColor,
                  terciaryColor,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.1, 0.6, 1.0],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Movimientos',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const MenuButton(
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      spacing: 30,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.title.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'ASUNCPR'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Gs. ${formatNumber(item.amount)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          ReceiptDetails(
            category: _gastosData.category,
            date: item.date,
            idRef: '1234567890',
          ),
        ],
      ),
    );
  }
}
